import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/provider/open_weather_provider.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherRepositoryImplementation extends WeatherRepositoryBase {
  final OpenWeatherProvider _provider;

  WeatherRepositoryImplementation(this._provider);

  @override
  Future<WeatherResponse> getWeather(String city) =>
      _provider.getWeather(city: city);
}
