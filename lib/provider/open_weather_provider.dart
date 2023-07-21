import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_custom_response.dart';
import 'package:weather_app/models/weather_response.dart';

class OpenWeatherService {
  OpenWeatherService._privateConstructor();

  static final OpenWeatherService _instance =
      OpenWeatherService._privateConstructor();

  factory OpenWeatherService() => _instance;
  String apiKey = 'cc82f16ddd145bb55547d3f2cb6f37a0';


  Future getWeather({
    @required city,
  }) async {
    try {

      final dio = Dio();
      final response = await dio.get('api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey');

      return WeatherResponse.fromJson(response.data);


    } catch (e) {
      return WeatherCustomResponse(isOk: false, message: e.toString());
    }
  }
}
