import 'package:flutter/material.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/services/weather_service.dart';

class LocationProvider extends ChangeNotifier{
  String mainCity = "None";
  List<LocationModel> _locationsList = [];

  String get getMainName => mainCity;
  List<LocationModel> get getListOfLocations => _locationsList;

  void setCity(String city){
    this.mainCity = city;
    notifyListeners();
  }

  void removeLocation(int id) async{
    _locationsList.removeAt(id);
    notifyListeners();
  }

  void addLocation(dynamic location) async {
    WeatherService weatherService = WeatherService();
    var response = await weatherService.weatherInfoUnencrypted(
      "10.0.2.2:30000",
      "/unencrypted/weather",
      {
        "longitude": "${location["lon"].toString()}",
        "latitude": "${location["lat"].toString()}" 
      }
    );
    var locationModel = LocationModel(
      name: location["display_name"].toString().split(",")[0], 
      longitude: location["lot"].toString(), 
      latitude: location["lat"].toString(), 
      descryption: location["display_name"].toString(),
      temperature: response!["current"]["temperature_2m"].toInt().toString(),
      airQuality: response["current"]["european_aqi"].toString()
    );

    _locationsList.add(locationModel);
    notifyListeners();
  }



}