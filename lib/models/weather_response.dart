import 'package:weather_app/models/weather_list_element.dart';

class WeatherResponse {
  String cod;
  List<WeatherListElement> list;

  WeatherResponse({
    required this.cod,
    required this.list,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      WeatherResponse(
        cod: json["cod"],
        list: List<WeatherListElement>.from(
            json["list"].map((x) => WeatherListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}
