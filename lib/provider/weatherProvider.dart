import 'package:flutter/material.dart';


class WeatherProvider extends ChangeNotifier{
  int currentTemperature = 0;
  String windSpeed = '';
  String sunrise = '';
  String sunset = '';
  String uv = '';
  String airQuality = '';
  Map<String,String> forecast = {};
  Map<String,Map<String,String>> forecastForToday = {};
  String moisture = '';
  String preceivedTemperature = '';
  String pressure = '';
  String chanceOfRain = '';

  int get getCurrentTemperature => currentTemperature;
  String get getWindSpeed => windSpeed;
  String get getSunrise => sunrise;
  String get getSunset => sunset;
  String get getUV => uv;
  String get getAirQuality => airQuality;
  String get getMoisture => moisture;
  String get getPreceivedTemperature => preceivedTemperature;
  String get getPressure => pressure;
  String get getchanceOfRain => chanceOfRain;

  set setForecast(Map<String,String> forecast){
    this.forecast = forecast;
    notifyListeners();
  }

  set setForecastForToday(Map<String,Map<String,String>> forecastForToday){
    this.forecastForToday = forecastForToday;
    notifyListeners();
  }

  set setCurrentTemperature(int currentTemperature){
    this.currentTemperature = currentTemperature;
    notifyListeners();
  }

  set setSunrise(String sunrise){
    this.sunrise = sunrise;
    notifyListeners();
  }

  set setSunset(String sunset){
    this.sunset = sunset;
    notifyListeners();
  }

  set setUV(String uv){
    this.uv = uv;
    notifyListeners();
  }

  set setAirQuality(String airQuality){
    this.airQuality = airQuality;
    notifyListeners();
  }

  set setMoisture(String moisture){
    this.moisture = moisture;
    notifyListeners();
  }

  set setPreceivedTemperature(String preceivedTemperature){
    this.preceivedTemperature = preceivedTemperature;
    notifyListeners();
  }

  set setPressure(String pressure){
    this.pressure = pressure;
    notifyListeners();
  }

  set setChanceOfRain(String chanceOfRain) {
    this.chanceOfRain = chanceOfRain;
    notifyListeners();
  }

  /*0:00:{
    "windSpeed": "11,1 km/h",
    "temperature": "15"
  } 
  */
  Map<String,String> getWeatherAt(String hour){
    Map<String,String> response = {};  
    if(forecastForToday.containsKey(hour)){
      response["windSpeed"] = forecastForToday[hour]!["windSpeed"]!;
      response["temperature"] = forecastForToday[hour]!["temperature"]!;
    }
    return response;
  }

   String getWeatherOnDay(String day){
    String response = '';  
    if(forecast.containsKey(day)){
      response = forecast[day].toString();
    }
    return response;
  }

}