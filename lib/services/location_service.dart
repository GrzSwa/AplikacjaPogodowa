import 'package:location/location.dart';

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
}