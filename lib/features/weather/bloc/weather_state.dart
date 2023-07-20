part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  final bool isEnglish;

  const WeatherState({
    required this.isEnglish,
  });
}

class WeatherInitialState extends WeatherState {
  const WeatherInitialState() : super(isEnglish: true);
}

class NewLanguageState extends WeatherState {
  final bool isEnglishChange;
  const NewLanguageState(this.isEnglishChange) : super(isEnglish: isEnglishChange);
}
