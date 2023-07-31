import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/design/widgets/assets.dart';
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
                onPressed: () => onLanguageTap('en'),
                child: state.lang == 'en'
                    ? Image.asset(
                        Assets.usaFlag,
                        scale: languageImageScale,
                      )
                    : Image.asset(
                        Assets.usaBlackWhite,
                        scale: languageImageScale,
                      ),
                style: ButtonStyle(
                  backgroundColor: getSelectedColor(state.lang == 'en'),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              ElevatedButton(
                onPressed: () => onLanguageTap('es'),
                child: state.lang == 'en'
                    ? Image.asset(
                        Assets.spainBlackWhite,
                        scale: languageImageScale,
                      )
                    : Image.asset(
                        Assets.spainFlag,
                        scale: languageImageScale,
                      ),
                style: ButtonStyle(
                  backgroundColor: getSelectedColor(state.lang != 'en'),
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

  void onLanguageTap(String lang) {
    BlocProvider.of<LanguageSwitcherBloc>(context, listen: false).add(
      ChangeLanguageEvent(lang),
    );
  }
}
