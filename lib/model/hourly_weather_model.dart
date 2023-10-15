class HourlyWeatherModel{
  final String time;
  final double temperature;
  final int weathercode;
  final double windspeed;

  HourlyWeatherModel({
    required this.time,
    required this.temperature,
    required this.weathercode,
    required this.windspeed
  });

  String get getTime => time;
  int get getWeathercode => weathercode; 
  double get getTemperature => temperature;
  double get getWindspeed => windspeed;
}