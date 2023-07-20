import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';

import '../../design/assets.dart';
import '../../design/widgets/navigation_bar/bottom_navigation_bar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Align(
          child: LanguageSwitcher(),
          alignment: Alignment.topRight,
        ),
      ),
      bottomNavigationBar: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: CitiesBottomNavigationBar(),
      ),
    );
  }
}

class CitiesSwiper extends StatefulWidget {
  const CitiesSwiper({Key? key}) : super(key: key);

  @override
  _CitiesSwiperState createState() => _CitiesSwiperState();
}

class _CitiesSwiperState extends State<CitiesSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          "https://via.placeholder.com/350x150",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
    );
  }
}

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  final double languageImageScale = 1.7;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => onLanguageTap(true),
                child: state.isEnglish
                    ? Image.asset(
                        Assets.usaFlag,
                        scale: languageImageScale,
                      )
                    : Image.asset(
                        Assets.usaBlackWhite,
                        scale: languageImageScale,
                      ),
                style: ButtonStyle(
                  backgroundColor: getSelectedColor(state.isEnglish),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              ElevatedButton(
                onPressed: () => onLanguageTap(false),
                child: state.isEnglish
                    ? Image.asset(
                        Assets.spainBlackWhite,
                        scale: languageImageScale,
                      )
                    : Image.asset(
                        Assets.spainFlag,
                        scale: languageImageScale,
                      ),
                style: ButtonStyle(
                  backgroundColor: getSelectedColor(!state.isEnglish),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  MaterialStateProperty<Color?> getSelectedColor(isEnglish) {
    return isEnglish
        ? MaterialStateProperty.all<Color>(Colors.white70)
        : MaterialStateProperty.all<Color>(Colors.white);
  }

  void onLanguageTap(bool isEnglish) {
    BlocProvider.of<WeatherBloc>(context, listen: false).add(
      ChangeLanguageEvent(isEnglish),
    );
  }
}
