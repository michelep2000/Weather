import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:weather_app/models/weather_list_element.dart';
import '../../design/widgets/language_switcher/language_switcher.dart';
import '../../design/widgets/navigation_bar/bottom_navigation_bar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  static double kelvinToCelsius(double kelvin) => kelvin - 273.15;

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
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
              if (state is WeatherLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black12,
                  ),
                );
              } else {
                return body(state.weatherResponse.list.first);
              }
            })
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const CitiesBottomNavigationBar(),
    );
  }

  Widget body(WeatherListElement weather) {
    final String mainTemp = "${kelvinToCelsius(weather.main.temp).round()}";

    return Center(
      child: Text(mainTemp, style: const TextStyle(
        fontSize: 100,
        letterSpacing: 2.1
      ),),
    );
  }
}
