import 'package:flutter/material.dart';
import 'package:just_weather/model/weather.dart';
import 'package:just_weather/bloc/weatherProvider.dart';
import 'package:just_weather/components/bottomCard.dart';
import 'package:just_weather/components/mainWeatherElement.dart';

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
  WeatherProvider wp = WeatherProvider();
  WeatherInfo weather;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    wp.updateWeather().then((value) {
      setState(() {
        weather = value;
        isLoading = false;
      });
    });
  }

  void _refreshWeather() {
    // if(isLoading) return;
    setState(() {
      isLoading = true;
    });
    wp.updateWeather().then((onValue) {
      setState(() {
        weather = onValue;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.fill)),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(top: 35),
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(100, 255, 255, 255)),
                      child: MainWeather(
                          settlement: weather.city,
                          temperature: weather.currentTemp)),
                  WeatherCard(_refreshWeather, weather)
                ],
              ),
      ),
    );
  }
}
