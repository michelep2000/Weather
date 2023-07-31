import 'package:flutter/material.dart';

import 'features/profile/profile_screen.dart';
import 'features/weather/weather_screen.dart';

class Routes {
  static const weather = 'weather';
  static const profile = 'profile';

  static getRoutes() {
    return <String, WidgetBuilder>{
      Routes.weather: (BuildContext context) => const WeatherScreen(),
      Routes.profile: (BuildContext context) => const ProfileScreen(),
    };
  }
}
