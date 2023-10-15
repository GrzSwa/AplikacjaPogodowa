// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/hourly_forecast.dart';
import 'package:weather_app/components/other.dart';
import 'package:weather_app/components/temperature.dart';
import 'package:weather_app/components/weather_forecast.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    LocationService locationService = LocationService();
    WeatherService weatherService = WeatherService();
    LocationData locationData = await locationService.getLocation();

    String city = await locationService.getCity(locationData);

    var info = await weatherService.weatherInfo(
      "api.open-meteo.com",
      "/v1/forecast",
      {
        "latitude":locationData.latitude.toString(), 
        "longitude":locationData.longitude.toString(),
        "daily":"weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max,precipitation_sum",
        "hourly":"temperature_2m,weathercode,windspeed_10m",
        "current":"temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,weathercode,surface_pressure,windspeed_10m",
        "timeformat":"iso8601",
        "timezone":"GMT"
      }
    );

    if(city != "Brak lokalizacji")
      Provider.of<LocationProvider>(context, listen: false).setCity(city);


//https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,weathercode,surface_pressure,windspeed_10m&hourly=temperature_2m,weathercode,windspeed_10m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,precipitation_sum,windspeed_10m_max&timezone=GMT
// spróbować zrobić splash screen ładujący dane i DataProvider, który sprawdzi czy wszystkie dane zostały załadowane a jak się nie uda
// w weatherProvider dać domyslne wartości.
    if(info != null){
      CurrentWeatherModel currentWeatherModel = CurrentWeatherModel(
        weathercode: info["current"]["weathercode"], 
        temperature: info["current"]["temperature_2m"], 
        precipitation: info["current"]["precipitation"], 
        relativehumidity: info["current"]["relativehumidity_2m"], 
        apparentTemperature: info["current"]["apparent_temperature"], 
        surfacePressure: info["current"]["surface_pressure"], 
        windspeed: info["current"]["windspeed_10m"]
      );

      Provider.of<WeatherProvider>(context, listen: false).addCurrentWeather(currentWeatherModel);
    }
  
    FlutterNativeSplash.remove();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: ()=> context.go('/add'), icon: Icon(Icons.add)),
        actions: [
          IconButton(onPressed: ()=> context.go('/settings'), icon: Icon(Icons.settings))
        ],
        title: Text(context.watch<LocationProvider>().getName),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 34, 126, 230),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.8,
              child: Center(child: Temperature())
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: WeatherForecast(),
              ),
            ),
            SizedBox(
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: HourlyForecast(),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Other(),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Center(
                  child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Dane zapewnione przez ", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13)),
                      TextSpan(text: "Open-Meteo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))
                    ]
                  )
                ))
              ),
            ),
          ],
        ),
      ),
    );
  }
}