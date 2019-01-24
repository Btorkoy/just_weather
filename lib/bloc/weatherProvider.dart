import 'package:just_weather/utils/location.dart';
import 'package:just_weather/model/weather.dart';
import 'package:just_weather/utils/weatherAPI.dart';

class WeatherProvider {
  Weather _weather;

  Weather get weather => _weather;

  Future<WeatherInfo> updateWeather() async {
    //get coordinates
    var location = Map<String, double>();
    location = await LocationAPI().getLocation();
    if (location == null) {
      throw Exception('Cannot pick location!');
    }
    var latitude = location['latitude'].toString();
    var longitude = location['longitude'].toString();

    return await WeatherAPI().getForecast(latitude, longitude);
  }
}
