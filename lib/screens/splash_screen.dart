import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/daily_weather_model.dart';
import 'package:weather_app/model/hourly_weather_model.dart';
import 'package:weather_app/provider/data_provider.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/provider/settings_provider.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/services/encryption_service.dart' as EncryptionService;
import 'package:weather_app/services/local_storage_service.dart';
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

  void initialization() async {
    LocalStorageService localStorageService = LocalStorageService();
    LocationService locationService = LocationService();
    WeatherService weatherService = WeatherService();
    LocationData locationData = await locationService.getLocation();
    int currentHour = DateTime.now().hour;
    String plainText = '{"longitude":"${locationData.longitude.toString()}", "latitude":${locationData.latitude.toString()}}';
    await localStorageService.loadlLocalStorage();
    // ignore: non_constant_identifier_names
    var PK = await weatherService.getPublicKey("127.0.0.1:30000","/key");
    var encrypted = EncryptionService.encryption(PK["public_key"], plainText);
    String unencodedPath = '';
    Map<String,dynamic> body = {};
    Map<dynamic, dynamic>? info;
    if(localStorageService.getSecurityStatus){
      unencodedPath = 'unencrypted/weather';
      body = {
        "longitude": locationData.longitude.toString(),
        "latitude": locationData.latitude.toString()
      };
      info = await weatherService.weatherInfoUnencrypted("127.0.0.1:30000",unencodedPath,body);
    }else{
      unencodedPath = "/astro/weather";
      body = { "encrypted_data":encrypted.base64, };
      info = await weatherService.weatherInfo("127.0.0.1:30000",unencodedPath,body);
    }

    

    if(info != null){
      Provider.of<LocationProvider>(context, listen: false).setCity(info["current"]["city_name"]);
      List<HourlyWeatherModel> hourlyWeatherList = [];
      List<DailyWeatherModel> dailyWeatherList = [];
      CurrentWeatherModel currentWeatherModel = CurrentWeatherModel(
        weathercode: info["current"]["weathercode"], 
        temperature: info["current"]["temperature_2m"], 
        precipitation: info["current"]["precipitation"], 
        relativehumidity: info["current"]["relativehumidity_2m"], 
        apparentTemperature: info["current"]["apparent_temperature"], 
        surfacePressure: info["current"]["surface_pressure"], 
        windspeed: info["current"]["windspeed_10m"],
        winddirection: info["current"]["winddirection_10m"],
        airQuality: info["current"]["european_aqi"]
      );

      for(int i = currentHour + 2; i < currentHour + 24; i++){
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
          "sunrise":sunrise.replaceAll(sunrise[1], (int.parse(sunrise[1])+2).toString()),
          "sunset":sunset.replaceAll(sunset[1], (int.parse(sunset[1])+2).toString()),
          "precipitation":precipitation,
          "windspeed":windspeed,
        };
        dailyWeatherList.add(DailyWeatherModel(data));
      }

      Provider.of<WeatherProvider>(context, listen: false).addCurrentWeather(currentWeatherModel);
      Provider.of<WeatherProvider>(context, listen: false).addHourlyWeather(hourlyWeatherList);
      Provider.of<WeatherProvider>(context, listen: false).addDailyweather(dailyWeatherList);
    }

    Provider.of<SettingsProvider>(context, listen: false).setDefaultSettings(localStorageService.getSettings);
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
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: const Color.fromARGB(255, 34, 126, 230),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25), 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/weatherLogo.png', scale: 2,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const LinearProgressIndicator(
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