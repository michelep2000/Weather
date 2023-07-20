import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';

import '../../design/assets.dart';

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
      SwitchLanguageEvent(isEnglish),
    );
  }
}
