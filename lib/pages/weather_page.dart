import 'package:flutter/material.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _WeatherService = WeatherService(apiKey: ' ');
  Weather? _weather;
  //fetch wheather
  fetchWeather() async {
    //get current city
    String cityName = await _WeatherService.getCurrentCity();
    //get weather for the city
    try {
      final weather = await _WeatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //wheather animation
  //init state
  @override
  void initState() {
    super.initState();
    //fetch weather on the start
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            Text(_weather?.cityName ?? 'Loading city..'),
            //templature
            Text('${_weather?.temperature.round()}ºC')
          ],
        ),
      ),
    );
  }
}
