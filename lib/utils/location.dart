import 'package:location/location.dart';
class LocationFinder{
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation() async{
    Location location = Location();
    bool _servicesEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    // Location Açık mı ?
    _servicesEnabled = await location.serviceEnabled();
    if(!_servicesEnabled){
      _servicesEnabled = await location.requestService();
      if(!_servicesEnabled){
      return;
      }
    }
    // Location izni
    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted!=PermissionStatus.granted){
        return;
      }
    }
    _locationData = await location.getLocation();
    latitude = _locationData.latitude!;
    longitude = _locationData.longitude!;

  }
}