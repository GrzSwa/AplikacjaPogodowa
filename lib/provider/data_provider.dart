import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier{
  bool _locationProviderStatus = false;
  bool _settingsProviderStatus = false;
  bool _weatherProviderStatus = false;

  bool get getLocationProviderStatus => _locationProviderStatus;
  bool get getSettingsProviderStatus => _settingsProviderStatus;
  bool get getWeatherProviderStatus => _weatherProviderStatus;

  void setLocationProviderStatus(bool value){
    this._locationProviderStatus = value;
    notifyListeners();
  }

  void setSettingsProviderStatus(bool value){
    this._settingsProviderStatus = value;
    notifyListeners();
  }

  void setWeatherProviderStatus(bool value){
    this._weatherProviderStatus = value;
    notifyListeners();
  }
}