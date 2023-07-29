import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_main_class.dart';

class WeatherListElement {
  WeatherMainClass main;
  List<Weather> weather;

  WeatherListElement({
    required this.main,
    required this.weather,
  });


  factory WeatherListElement.fromJson(Map<String, dynamic> json) => WeatherListElement(
    main: WeatherMainClass.fromJson(json["main"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
  };

}
