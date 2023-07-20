import 'package:flutter/material.dart';
import '../../design/widgets/language_switcher/language_switcher.dart';
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
      bottomNavigationBar: CitiesBottomNavigationBar(),
    );
  }
}
