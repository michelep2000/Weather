part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class SwitchLanguageEvent extends WeatherEvent {
  final bool isEnglish;

  SwitchLanguageEvent(this.isEnglish);
}
