import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/design/assets.dart';
import 'package:weather_app/design/widgets/language_switcher/language_switcher_bloc.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  final double languageImageScale = 1.7;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageSwitcherBloc, LanguageSwitcherState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                clipBehavior: Clip.antiAlias,
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
    BlocProvider.of<LanguageSwitcherBloc>(context, listen: false).add(
      ChangeLanguageEvent(isEnglish),
    );
  }
}
