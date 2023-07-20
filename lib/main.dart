import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/design/widgets/language_switcher/language_switcher_bloc.dart';
import 'package:weather_app/design/widgets/navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:weather_app/features/profile/profile_screen.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WeatherBloc()),
        BlocProvider(create: (_) => BottomNavigationBarBloc()),
        BlocProvider(create: (_) => LanguageSwitcherBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'weather',
        routes: {
          'weather': (_) => const WeatherScreen(),
          'profile': (_) => const ProfileScreen(),
        },
      ),
    );
  }
}
