import 'dart:math';

class Weather{
  WeatherInfo getWeather(String city){
    int temp = new Random().nextInt(60) - 30;
    String main = 'Clean';

    return new WeatherInfo(
      city: city,
      temp: '$temp',
      min: '${temp - 2}',
      max: '${temp + 2}',
      main: main
    );
  }
}

class WeatherInfo{
  final String city;
  final String temp;
  final String min;
  final String max;
  final String main;
  WeatherInfo({this.city, this.temp, this.min, this.max, this.main});

}