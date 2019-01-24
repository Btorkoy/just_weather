import 'package:location/location.dart';

class LocationAPI {
  String latitude;
  String longitude;
  Future<Map<String, double>> getLocation() async{
    var location = Map<String, double>();
    // Platform messages may fail, so we use a try/catch PlatformException.
    try{
      location = await Location().getLocation();
    } on Exception {
      location = null;
    }
    return location;
  }
}