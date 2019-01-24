import 'package:flutter/material.dart';
import 'package:just_weather/model/weather.dart';
import 'package:just_weather/utils/iconsMap.dart';

class WeatherCard extends StatelessWidget {
  final VoidCallback onTap;
  final WeatherInfo weather;

  WeatherCard(this.onTap, this.weather);

  @override
  Widget build(BuildContext context) {
    var weatherByDays = weather.days;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _getRow('Today', weatherByDays[0].min, weatherByDays[0].max,
                  weatherByDays[0].icon),
              Divider(),
              _getRow('Tomorrow', weatherByDays[1].min, weatherByDays[1].max,
                  weatherByDays[1].icon),
              _getRow(
                  _getWeakday(weatherByDays[1].date.weekday),
                  weatherByDays[2].min,
                  weatherByDays[2].max,
                  weatherByDays[2].icon),
            ]),
      ),
    );
  }

  Widget _getRow(String day, double min, double max, String iconName) =>
      Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(day),
            ),
            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Text('${min.round()}\u{2103} ~ ${max.round()}\u{2103}'),
              ),
              Container(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(WeatherIcons.getIcon(iconName))),
            ])
          ],
        ),
      );

  String _getWeakday(int day) {
    switch (day) {
      case 0:
        return "Monday";
      case 1:
        return "Tuesday";
      case 2:
        return "Wednesday";
      case 3:
        return "Thursday";
      case 4:
        return "Friday";
      case 5:
        return "Saturday";
      case 6:
        return "Sunday";
    }
    return '';
  }
}
