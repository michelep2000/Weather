import 'package:flutter/material.dart';

enum OpenWeatherState {
  CLEAR_SKY,
  FEW_CLOUDS,
  SCATTERED_CLOUDS,
  BROKEN_CLOUDS,
  OVERCAST_CLOUDS,
  LIGHT_RAIN,
  SHOWER_RAIN,
  RAIN,
  THUNDERSTORM,
  SNOW,
  MIST
}

extension StateMapper on OpenWeatherState? {
  Color getBackgroundColor(BuildContext? buildContext) {
    switch (this) {
      case OpenWeatherState.CLEAR_SKY:
        return Colors.lightBlueAccent;
      case OpenWeatherState.FEW_CLOUDS:
        return Colors.blueAccent;
      case OpenWeatherState.SCATTERED_CLOUDS:
        return Colors.blueAccent;
      case OpenWeatherState.BROKEN_CLOUDS:
        return Colors.blueGrey;
      case OpenWeatherState.OVERCAST_CLOUDS:
        return Colors.blueGrey;
      case OpenWeatherState.LIGHT_RAIN:
        return Colors.blueAccent.shade100;
      case OpenWeatherState.SHOWER_RAIN:
        return Colors.deepPurple.withOpacity(0.3);
      case OpenWeatherState.RAIN:
        return Colors.teal;
      case OpenWeatherState.SNOW:
        return Colors.lightBlueAccent.withOpacity(0.3);
      case OpenWeatherState.MIST:
        return Colors.grey.withOpacity(0.3);
      default:
        return Colors.white;
    }
  }
}

extension WeatherStateMapperString on String? {
  OpenWeatherState toWeatherState() {
    switch (this) {
      case 'clear sky':
        return OpenWeatherState.CLEAR_SKY;
      case 'few clouds':
        return OpenWeatherState.FEW_CLOUDS;
      case 'scattered clouds':
        return OpenWeatherState.SCATTERED_CLOUDS;
      case 'broken clouds':
        return OpenWeatherState.BROKEN_CLOUDS;
      case 'overcast clouds':
        return OpenWeatherState.BROKEN_CLOUDS;
      case 'light rain':
        return OpenWeatherState.SHOWER_RAIN;
      case 'shower rain':
        return OpenWeatherState.SHOWER_RAIN;
      case 'rain':
        return OpenWeatherState.RAIN;
      case 'snow':
        return OpenWeatherState.SNOW;
      case 'mist':
        return OpenWeatherState.MIST;
      default:
        return OpenWeatherState.CLEAR_SKY;
    }
  }
}