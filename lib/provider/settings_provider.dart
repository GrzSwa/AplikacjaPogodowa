import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  final List<String> _temperatureUnit = ["ºC", "ºF"];
  final List<String> _utniOfWindSpeed = ["Skala Beauforta", "Kilometrów na godzinę (km/h)", "Metrów na sekundę (m/s)", "Mil na godzinę (mph)", "Węzłów (kn)"];
  final List<String> _unitOfAtmosphericPressure = ["Hektopaskal (hPa)", "Milibar (mbar)", "Milimetr rtęci (mmHg)", "Cal rtęci (inHG)", "Standardowa atmosfera (atm)"];
  final bool _autoUpdate = false;
  final bool _soundEffect = false;
  final bool _security = false;
  Map<String, dynamic> _defaultSettings = {};

  List<String> get getTemperatureUnit => _temperatureUnit;
  List<String> get getUtniOfWindSpeed => _utniOfWindSpeed;
  List<String> get getUnitOfAtmosphericPressure => _unitOfAtmosphericPressure;
  bool get getAutoUpdate => _autoUpdate;
  bool get getsoundEffecte => _soundEffect;
  bool get getSecurity => _security;
  Map<String, dynamic> get getDefaultSettings => _defaultSettings;

  void setDefaultSettings(Map<String,dynamic> settings){
    this._defaultSettings = settings;
    notifyListeners();
  }

  void setSecurity(bool value) async{
    this._defaultSettings["security"] = value;
    notifyListeners();
  }

  void setTemperatureUnit(String temperatureUnit) async{
    this._defaultSettings["temperatureUnit"] = temperatureUnit;
    notifyListeners();
  }

  void setUtniOfWindSpeed(String utniOfWindSpeed) async{
    this._defaultSettings["utniOfWindSpeed"] = utniOfWindSpeed;
    notifyListeners();
  }

  void setUnitOfAtmosphericPressure(String unitOfAtmosphericPressure) async{
    this._defaultSettings["unitOfAtmosphericPressure"] = unitOfAtmosphericPressure;
    notifyListeners();
  }

  void setAutoUpdate(bool autoUpdate) async{
    this._defaultSettings["autoUpdate"] = autoUpdate;
    notifyListeners();
  }

  void setSoundEffect(bool soundEffect) async{
    this._defaultSettings["soundEffect"] = soundEffect;
    notifyListeners();
  }

}