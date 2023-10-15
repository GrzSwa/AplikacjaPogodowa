import 'dart:convert';
import 'package:location/location.dart';
import 'package:weather_app/services/http_service.dart';

class LocationService{
  late Location location;
  late PermissionStatus _permissionStatus;
  late LocationData _locationData;
  late bool _serviceEnabled;

  LocationService(){
    location = Location();
  }

  Future<LocationData> getLocation() async{

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
    }

    _permissionStatus = await location.hasPermission();
    if(_permissionStatus == PermissionStatus.denied){
      _permissionStatus = await location.requestPermission();
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
  
  Future <String> getCity(LocationData locationData) async{
    var response = await responseBody("geocode.maps.co","/reverse",{"lat":locationData.latitude.toString(), "lon":locationData.longitude.toString()});
    
    var decodedResponse = jsonDecode(response!.body) as Map;
    if(decodedResponse["address"]["city"] != null)
      return decodedResponse["address"]["city"];
    else if(decodedResponse["address"]["village"] != null)
      return decodedResponse["address"]["village"];
    else
      return 'Brak lokalizacji';

  }


}