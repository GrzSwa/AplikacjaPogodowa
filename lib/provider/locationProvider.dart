import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier{
  String name = "Kielce";
  late LocationData locationData;

  String get getName => name;

  void setLocation(LocationData location){
    locationData = location;
    changeCity(locationData.accuracy.toString());
    notifyListeners();
  }

  void changeCity(String city) async{
    name = city;
    notifyListeners();
  }


}