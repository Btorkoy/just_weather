class Weather {
  double min;
  double max;
  String icon;
  DateTime date;

  Weather({this.date, this.icon, this.max, this.min});
  static Weather fromMap(Map<String, dynamic> object) => Weather(
      min: object['temperatureMin'],
      max: object['temperatureMax'],
      icon: object['icon'],
      date: DateTime.parse('1970-01-01 03:00:00Z')
          .add(new Duration(seconds: object['time'])));
}

class WeatherInfo {
  String city;
  List<Weather> days;
  double currentTemp;

  WeatherInfo() {
    days = List<Weather>();
  }
}
