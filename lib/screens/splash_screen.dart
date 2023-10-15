import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/daily_weather_model.dart';
import 'package:weather_app/model/hourly_weather_model.dart';
import 'package:weather_app/provider/data_provider.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/router/router.dart' as routerScreens;

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

   @override
    void initState() {
      initialization();
      super.initState();
    }
//https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,weathercode,surface_pressure,windspeed_10m&hourly=temperature_2m,weathercode,windspeed_10m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,precipitation_sum,windspeed_10m_max&timezone=GMT

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
        "daily":"weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max,precipitation_sum,windspeed_10m_max",
        "hourly":"temperature_2m,weathercode,windspeed_10m",
        "current":"temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,weathercode,surface_pressure,windspeed_10m",
        "timeformat":"iso8601",
        "timezone":"GMT"
      }
    );

    if(city != "Brak lokalizacji")
      Provider.of<LocationProvider>(context, listen: false).setCity(city);

    if(info != null){
      List<HourlyWeatherModel> hourlyWeatherList = [];
      List<DailyWeatherModel> dailyWeatherList = [];
      CurrentWeatherModel currentWeatherModel = CurrentWeatherModel(
        weathercode: info["current"]["weathercode"], 
        temperature: info["current"]["temperature_2m"], 
        precipitation: info["current"]["precipitation"], 
        relativehumidity: info["current"]["relativehumidity_2m"], 
        apparentTemperature: info["current"]["apparent_temperature"], 
        surfacePressure: info["current"]["surface_pressure"], 
        windspeed: info["current"]["windspeed_10m"]
      );

      for(int i = 0; i < 24; i++){
        var time = info["hourly"]["time"][i].toString().substring(11, 16);
        var temperature = info["hourly"]["temperature_2m"][i] as double;
        var weathercode = info["hourly"]["weathercode"][i] as int;
        var windspeed = info["hourly"]["windspeed_10m"][i] as double;
        hourlyWeatherList.add(HourlyWeatherModel(time: time, temperature: temperature, weathercode: weathercode, windspeed: windspeed));
      }

      for(int i = 0; i < 7; i++){
        var time = info["daily"]["time"][i].toString();
        var maxTemperature = info["daily"]["temperature_2m_max"][i] as double;
        var minTemperature = info["daily"]["temperature_2m_min"][i] as double;
        var weathercode = info["daily"]["weathercode"][i] as int;
        var windspeed = info["daily"]["windspeed_10m_max"][i] as double;
        var sunrise = info["daily"]["sunrise"][i].toString().substring(11, 16);
        var sunset = info["daily"]["sunset"][i].toString().substring(11, 16);
        var precipitation = info["daily"]["precipitation_sum"][i] as double;
        var data = {
          "time":time,
          "weathercode":weathercode,
          "maxTemp":maxTemperature,
          "minTemp":minTemperature,
          "sunrise":sunrise,
          "sunset":sunset,
          "precipitation":precipitation,
          "windspeed":windspeed,
        };
        dailyWeatherList.add(DailyWeatherModel(data));
      }

      Provider.of<WeatherProvider>(context, listen: false).addCurrentWeather(currentWeatherModel);
      Provider.of<WeatherProvider>(context, listen: false).addHourlyWeather(hourlyWeatherList);
      Provider.of<WeatherProvider>(context, listen: false).addDailyweather(dailyWeatherList);
    }
    
    Provider.of<DataProvider>(context, listen: false).setLocationProviderStatus(true);
    Provider.of<DataProvider>(context, listen: false).setSettingsProviderStatus(true);
    Provider.of<DataProvider>(context, listen: false).setWeatherProviderStatus(true);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: ((context, value, child){
        if(value.getLocationProviderStatus && value.getSettingsProviderStatus && value.getWeatherProviderStatus){
          return  MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routerScreens.router,
          );
        }else{
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Color.fromARGB(255, 34, 126, 230),
              body: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25), 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/weatherLogo.png', scale: 2,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(255, 34, 126, 230),
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
              ))
            ),
          );
        }
      })
    );
  }
}