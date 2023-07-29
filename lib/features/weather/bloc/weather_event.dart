part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  final String city;

  LoadWeatherEvent({required this.city});
}

