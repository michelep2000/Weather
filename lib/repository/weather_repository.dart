import 'package:weather_app/models/weather_response.dart';

abstract class WeatherRepositoryBase {
  Future<WeatherResponse> getWeather(String city);
}