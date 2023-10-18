class LocationModel{
  String name;
  String longitude;
  String latitude;
  String descryption;
  String temperature;
  String airQuality;
  LocationModel({required this.name, required this.longitude, required this.latitude, required this.descryption, required this.temperature, required this.airQuality});

  String get getName => name;
  String get getLongitude => longitude;
  String get getLatitude => latitude;
  String get getDescryption => descryption;
  String get getTemperature => temperature;
  String get getAirQuality => airQuality;
}