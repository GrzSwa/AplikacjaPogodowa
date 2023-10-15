class CurrentWeatherModel{
  final int weathercode;
  final double temperature;
  final double precipitation;
  final int relativehumidity;
  final double apparentTemperature;
  final double surfacePressure;
  final double windspeed;

  CurrentWeatherModel({
      required this.weathercode, 
      required this.temperature,
      required this.precipitation,
      required this.relativehumidity,
      required this.apparentTemperature,
      required this.surfacePressure,
      required this.windspeed,
    }
  );

  int get getWeathercode => weathercode; 
  double get getTemperature => temperature;
  double get getPrecipitation => precipitation;
  int get getRelativehumidity => relativehumidity;
  double get getApparentTemperature => apparentTemperature;
  double get getDurfacePressure => surfacePressure;
  double get getWindspeed => windspeed;
}