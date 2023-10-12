import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier{
  String name = "Kielce";
  List<String> _locationsList = ["Kielce","Tarnobrzeg"];
  late LocationData locationData;

  String get getName => name;
  List<String> get getListOfLocations => _locationsList;

  void setLocation(LocationData location){
    locationData = location;
    changeCity(locationData.accuracy.toString());
    notifyListeners();
  }

  void addLocation(String location) async {
    _locationsList.add(location);
    notifyListeners();
  }

  void changeCity(String city) async{
    name = city;
    notifyListeners();
  }


}