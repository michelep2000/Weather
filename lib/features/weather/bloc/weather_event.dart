part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  final String city;
  final String lang;

  LoadWeatherEvent({required this.city, required this.lang});
}

