class DailyWeatherModel{
  late String _date ;
  late int _weathercode;
  late double _maxTemperature ;
  late double _minTemperature;
  late String _sunrise;
  late String _sunset;
  late double _precipitation;
  late int _relativehumidity;
  late double _apparentTemperature;
  late double _surfacePressure;
  late double _windspeed;


  DailyWeatherModel(Map<String,dynamic> currentDay){
    this._date = currentDay["time"];
    this._weathercode = currentDay["weathercode"] as int;
    this._maxTemperature = currentDay["maxTemp"] as double;
    this._minTemperature = currentDay["minTemp"] as double;
    this._sunrise = currentDay["sunrise"];
    this._sunset = currentDay["sunset"];
    this._precipitation = currentDay["precipitation"] as double;
    this._relativehumidity = currentDay["relativehumidity"] as int;
    this._apparentTemperature = currentDay["apparentTemperature"] as double;
    this._surfacePressure = currentDay["surfacePressure"] as double;
    this._windspeed = currentDay["windspeed"] as double;
  }

  String get getDate=>_date;
  int get getWeathercode => _weathercode; 
  double get getMaxTemperature => _maxTemperature;
  double get getMinTemperature => _minTemperature;
  String get getSunrise => _sunrise;
  String get getSunset => _sunset;
  double get getPrecipitation => _precipitation;
  int get getRelativehumidity => _relativehumidity;
  double get getApparentTemperature => _apparentTemperature;
  double get getDurfacePressure => _surfacePressure;
  double get getWindspeed => _windspeed;
}