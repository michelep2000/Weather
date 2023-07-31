import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/design/widgets/language_switcher/language_switcher_bloc.dart';
import 'package:weather_app/design/widgets/navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/routes.dart';

import '../../constants/weather_states.dart';
import '../../design/widgets/assets.dart';
import '../../design/widgets/language_switcher/language_switcher.dart';
import '../../design/widgets/navigation_bar/bottom_navigation_bar.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  static double kelvinToCelsius(double kelvin) => kelvin - 273.15;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late int index;
  late String lang;
  late StreamSubscription subscription;

  @override
  void initState() {
    index = 0;
    lang = 'en';

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final weatherBloc = BlocProvider.of<WeatherBloc>(context, listen: false);

      weatherBloc.add(LoadWeatherEvent(city: getCityByIndex(0), lang: 'en'));

      subscription = BlocProvider.of<BottomNavigationBarBloc>(context, listen: false)
          .stream
          .listen(
        (event) {
          index = event.index;

          weatherBloc.add(
            LoadWeatherEvent(city: getCityByIndex(event.index), lang: lang),
          );
        },
      );

      BlocProvider.of<LanguageSwitcherBloc>(context, listen: false)
          .stream
          .listen(
        (event) {
          lang = event.lang;

          weatherBloc.add(
            LoadWeatherEvent(city: getCityByIndex(index), lang: event.lang),
          );
        },
      );
    });
    super.initState();
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.weatherDescription
              .toWeatherState()
              .getBackgroundColor(context),
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  child: profileWidget(context),
                  alignment: Alignment.topLeft,
                ),
                const Align(
                  child: LanguageSwitcher(),
                  alignment: Alignment.topRight,
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (_, state) {
                    if (state is WeatherLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black12,
                        ),
                      );
                    } else if (state.weatherResponse.list.isNotEmpty) {
                      final response = state.weatherResponse;
                      return body(response);
                    } else {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          extendBody: true,
          bottomNavigationBar: const CitiesBottomNavigationBar(),
        );
      },
    );
  }

  Widget body(WeatherResponse weather) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    _weatherWidget(
                      temp: weather.list.first.main.tempMin,
                      fontSize: 35,
                      iconSize: 10,
                    ),
                    const Text(
                      'Min',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              _weatherWidget(
                temp: weather.list.first.main.temp,
                fontSize: 100,
                iconSize: 25,
              ),
              Column(
                children: [
                  _weatherWidget(
                    temp: weather.list.first.main.tempMax,
                    fontSize: 35,
                    iconSize: 10,
                  ),
                  const Text(
                    'Max',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://openweathermap.org/img/wn/${weather.list.first.weather.first.icon}@2x.png",
                    scale: 2),
                placeholder: const NetworkImage(
                    "https://openweathermap.org/img/wn/03n@2x.png",
                    scale: 2),
              ),
              Text(
                weather.list.first.weather.first.description,
                style: const TextStyle(color: Colors.white, letterSpacing: 2.1),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _weatherWidget(
      {required double temp,
      required double fontSize,
      required double iconSize}) {
    final String mainTemp = "${WeatherScreen.kelvinToCelsius(temp).round()}";
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTemp,
            style: TextStyle(
              fontSize: fontSize,
              letterSpacing: 2.1,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.circle_outlined,
            size: iconSize,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  getCityByIndex(int index) {
    switch (index) {
      case 0:
        return 'paris';
      case 1:
        return 'berlin';
      case 2:
        return 'rome';
    }
  }

  Widget profileWidget(BuildContext context) {
    return GestureDetector(
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: ClipOval(
            child: Material(
              elevation: 10.0,
              child: CircleAvatar(
                backgroundColor: Colors.white60,
                radius: 35,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://e7.pngegg.com/pngimages/348/800/png-clipart-man-wearing-blue-shirt-illustration-computer-icons-avatar-user-login-avatar-blue-child.png',
                      scale: 2),
                  placeholder: AssetImage(Assets.userPlaceholder),
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
        ),
        onTap: () => Navigator.pushNamed(context, Routes.profile));
  }
}
