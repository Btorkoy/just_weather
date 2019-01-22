import 'package:flutter/material.dart';
import 'package:app/weather.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(){
    weather = Weather().getWeather(city);
  }
  final String city = 'Sankt-Peterburg';
  WeatherInfo weather;
  void _refreshWeather() {
    setState(() {
      weather = Weather().getWeather(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildTempElement(context, weather),
             GestureDetector(
               onTap: _refreshWeather,
               child: buildCard(context, weather),
             ),
          ], 
        ),  
      ),
    );
  }
}

Widget buildCard(BuildContext context, WeatherInfo weather){
  Widget getRow(String day, String min, String max, String main, IconData icon) => Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5), 
          child: Text(day),
        ),
        Row(
          children: <Widget> [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Text('$min\u{2103} ~ $max\u{2103}'),
            ),
            
            Container(
              padding: EdgeInsets.only(right: 5) ,
              child: Icon(icon)
            ),
          ]
        )
      ],
    ),
  );
  
  return  Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround, 
        children: <Widget>[
          getRow('Today', weather.min, weather.max, 'Malh', Icons.wb_sunny),
          Divider(),
          getRow('Tomorrow', '10', '14', 'Dog1', Icons.wb_cloudy),
          getRow('Loam', '-1', '0', 'Loa', Icons.ac_unit),
          getRow('Tsul', '1', '4', 'Hott', Icons.wb_cloudy),
        ] 
      ),
  );
}

Container buildTempElement(BuildContext context, WeatherInfo weather)
{
  return Container(
    padding:EdgeInsets.all(15),
    margin: EdgeInsets.only(top: 35),
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color.fromARGB(100, 255, 255, 255)
    ),
    child: Column(
      children: <Widget>[
        Text(weather.city),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: getTempElement(weather.temp, Theme.of(context).textTheme.display1)
        )
        ]
    ),   
  );
}

Widget getTempElement(String temp, TextStyle style){
  var styleCelsiusSymbol = style.copyWith(fontSize: style.fontSize/2);
  return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(temp, style: style,),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(top: 5),
            child: Text('\u2103', style: styleCelsiusSymbol),
          )
        ],
      
  );
}