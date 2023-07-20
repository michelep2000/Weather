part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  final int bottomItemSelected;
  final bool isEnglish;

  const WeatherState({
    required this.bottomItemSelected,
    required this.isEnglish,
  });
}

class WeatherInitialState extends WeatherState {
  const WeatherInitialState() : super(bottomItemSelected: 0, isEnglish: true);
}

class NewLanguageState extends WeatherState {
  final bool isEnglishChange;
  const NewLanguageState(this.isEnglishChange) : super(bottomItemSelected: 0, isEnglish: isEnglishChange);
}
