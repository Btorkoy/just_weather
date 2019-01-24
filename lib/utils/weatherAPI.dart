import 'dart:convert';
import 'package:http/http.dart';
import 'package:just_weather/model/weather.dart';

class WeatherAPI {
  final String _host = 'https://api.darksky.net/forecast';
  final String _apiKey = 'de1f88513712bf5cfed0f5bb46a83f98';

  Future<WeatherInfo> getForecast(String latitude, String longitude) async {
    String url =
        '$_host/$_apiKey/$latitude,$longitude?exclude=hourly&lang=ru&units=si';
    var responce = await get(url);
    if (responce.statusCode != 200) return null;

    var weather = WeatherInfo();
    var body = jsonDecode(responce.body);
    weather.city = body['timezone'].split('/')[1];
    var currently = body['currently'];
    weather.currentTemp = currently['temperature'];

    var temp = body['daily']['data'];
    for (int i = 0; i < 3; ++i) {
      Weather day = Weather.fromMap(temp[i]);
      weather.days.add(day);
    }
    return weather;
  }
}
