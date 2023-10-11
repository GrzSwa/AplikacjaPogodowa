import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier{
  String name = "Kielce";

  String get getName => name;

  void changeCity(String city) async{
    name = city;
    notifyListeners();
  }
}