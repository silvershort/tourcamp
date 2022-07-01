import 'package:geolocator/geolocator.dart';

class GeoLocatorUtil {
  static Future<bool> getGPS() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return true;
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
      default:
        return false;
    }
  }

  static Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return true;
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
      default:
        return false;
    }
  }
}