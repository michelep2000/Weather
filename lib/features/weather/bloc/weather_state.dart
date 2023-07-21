part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  WeatherResponse get  weatherResponse => WeatherResponse(cod: '', list: []);
}

class WeatherInitialState extends WeatherState {}
class WeatherLoadingState extends WeatherState {}

class WeatherLoadingSuccessState extends WeatherState {
  final WeatherResponse response;
  WeatherLoadingSuccessState(this.response);

  @override
  WeatherResponse get weatherResponse => response;

}
