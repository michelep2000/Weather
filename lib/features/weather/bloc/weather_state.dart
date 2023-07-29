part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  String get weatherDescription => '';
  WeatherResponse get  weatherResponse => WeatherResponse(cod: '', list: []);
}

class WeatherInitialState extends WeatherState {}
class WeatherLoadingState extends WeatherState {}

class WeatherLoadingSuccessState extends WeatherState {
  final WeatherResponse response;
  WeatherLoadingSuccessState(this.response);

  @override
  String get weatherDescription => response.list.first.weather.first.description;

  @override
  WeatherResponse get weatherResponse => response;

}
