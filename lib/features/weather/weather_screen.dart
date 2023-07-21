import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';
import '../../design/widgets/language_switcher/language_switcher.dart';
import '../../design/widgets/navigation_bar/bottom_navigation_bar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<WeatherBloc>(context, listen: false)
        .add(LoadWeatherEvent());

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Align(
              child: LanguageSwitcher(),
              alignment: Alignment.topRight,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.weatherResponse.cod,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const CitiesBottomNavigationBar(),
    );
  }
}
