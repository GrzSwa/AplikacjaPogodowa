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

  Future<void> getLocation() async{

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
    }

    _permissionStatus = await location.hasPermission();
    if(_permissionStatus == PermissionStatus.denied){
      _permissionStatus = await location.requestPermission();
    }

    _locationData = await location.getLocation();
  }

  Future <String> getCity() async{
    await getLocation();
    var response = await responseBody(_locationData.latitude.toString(), _locationData.longitude.toString());
    var decodedResponse = jsonDecode(response!.body) as Map;
    if(decodedResponse["address"]["city"] != null)
      return decodedResponse["address"]["city"];
    else if(decodedResponse["address"]["village"] != null)
      return decodedResponse["address"]["village"];
    else
      return 'Brak lokalizacji';

  }


}