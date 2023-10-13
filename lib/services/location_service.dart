import 'dart:convert';

import 'package:location/location.dart';
import 'package:http/http.dart' as http;

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

  Future <String> getCity()async {
    var url = Uri.https("geocode.maps.co","/reverse",{"lat":"${_locationData.latitude}", "lon":"${_locationData.longitude}"});
    var response = await http.get(url);
    if(response.statusCode == 200){
      var decode = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      if(decode["address"]["city"] != null)
        return decode["address"]["city"];
      else
        return decode["address"]["village"];
    }
    return "Brak lokalizacji";
  }


}