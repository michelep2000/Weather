import 'package:weather_app/models/weather_main_class.dart';

class WeatherListElement {
  WeatherMainClass main;

  WeatherListElement({
    required this.main,
  });


  factory WeatherListElement.fromJson(Map<String, dynamic> json) => WeatherListElement(
    main: WeatherMainClass.fromJson(json["main"]),
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
  };

}
