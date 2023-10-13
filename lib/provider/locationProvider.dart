import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier{
  String name = "None";
  List<String> _locationsList = ["Kielce","Tarnobrzeg"];

  String get getName => name;
  List<String> get getListOfLocations => _locationsList;

  void setCity(String city){
    this.name = city;
    notifyListeners();
  }

  void addLocation(String location) async {
    _locationsList.add(location);
    notifyListeners();
  }



}