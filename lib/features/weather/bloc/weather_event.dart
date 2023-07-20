part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class ChangeLanguageEvent extends WeatherEvent {
  final bool isEnglish;

  ChangeLanguageEvent(this.isEnglish);
}


