class CurrentWeatherModel{
  final int weathercode;
  final double temperature;
  final double precipitation;
  final int relativehumidity;
  final double apparentTemperature;
  final double surfacePressure;
  final double windspeed;
  final int winddirection;
  final int airQuality;

  CurrentWeatherModel({
      required this.weathercode, 
      required this.temperature,
      required this.precipitation,
      required this.relativehumidity,
      required this.apparentTemperature,
      required this.surfacePressure,
      required this.windspeed,
      required this.winddirection,
      required this.airQuality
    }
  );

  int get getWeathercode => weathercode; 
  double get getTemperature => temperature;
  double get getPrecipitation => precipitation;
  int get getRelativehumidity => relativehumidity;
  double get getApparentTemperature => apparentTemperature;
  double get getDurfacePressure => surfacePressure;
  double get getWindspeed => windspeed;
  int get getWindDirection => winddirection;
  int get getAirQuality => airQuality;
}