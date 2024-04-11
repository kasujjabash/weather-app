class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  Weather(
      {required this.cityName,
      required this.temperature,
      required this.mainCondition});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: "name",
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  } //methode to deal with the json file data from the api
}
