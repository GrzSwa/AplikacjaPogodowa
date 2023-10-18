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
  
  Future <List<Map<dynamic,dynamic>>> getCity(String url, [String unencodePath = '', Map<String, dynamic>? queryParams]) async{
    List<Map<dynamic,dynamic>> list = [];
    var response = await responseBody(url,unencodePath,queryParams);
    var responseByte = utf8.decode(response!.bodyBytes); 
    var modifyResponseByte = responseByte.replaceAll(r'\"','"');
    var convertToString = modifyResponseByte.substring(1,modifyResponseByte.length - 1);
    var convertToList = convertToString.split("},");
    for(var i in convertToList){
      if(i.endsWith("}")){
        var decodedResponse = jsonDecode(i) as Map;
        list.add(decodedResponse);
      }else{
        var decodedResponse = jsonDecode(i+"}") as Map;
        list.add(decodedResponse);
      }

    }
    
    return list;

  }


}