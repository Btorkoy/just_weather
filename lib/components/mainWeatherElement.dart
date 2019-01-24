import 'package:flutter/material.dart';

class MainWeather extends StatelessWidget {
  final String settlement;
  final double temperature;

  const MainWeather({this.settlement, this.temperature});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.display1;
    var styleCelsiusSymbol = style.copyWith(fontSize: style.fontSize / 2);
    return Column(children: <Widget>[
      Text(settlement),
      Container(
          margin: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                temperature.round().toString(),
                style: style,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 5),
                child: Text('\u2103', style: styleCelsiusSymbol),
              )
            ],
          ))
    ]);
  }
}
