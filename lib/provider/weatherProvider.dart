import 'package:flutter/material.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/model/daily_weather_model.dart';
import 'package:weather_app/model/hourly_weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  late List<DailyWeatherModel> _dailyWeatherList ;
  late CurrentWeatherModel _currentWeather;
  late List<HourlyWeatherModel> _hourlyWeatherList;
  DailyWeatherModel getDailyweather(int index){ return _dailyWeatherList[index]; }
  CurrentWeatherModel getCurrentWeather(){ return _currentWeather; }
  HourlyWeatherModel getHourlyWeather(int index){ return _hourlyWeatherList[index]; }
  List<HourlyWeatherModel> getHourlyWeatherList() { return _hourlyWeatherList;}
  void addDailyweather(List<DailyWeatherModel> dailyWeatherModel) async{
    _dailyWeatherList = dailyWeatherModel;
    notifyListeners();
  }

  void addCurrentWeather(CurrentWeatherModel currentWeatherModel) async{
    _currentWeather = currentWeatherModel;
    notifyListeners();
  }

  void addHourlyWeather(List<HourlyWeatherModel> hourlyWeatherModel) async{
    _hourlyWeatherList = hourlyWeatherModel;
    notifyListeners();
  }

}