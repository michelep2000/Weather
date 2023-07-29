import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/design/widgets/navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../assets.dart';

class CitiesBottomNavigationBar extends StatefulWidget {
  const CitiesBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CitiesBottomNavigationBarState createState() =>
      _CitiesBottomNavigationBarState();
}

class _CitiesBottomNavigationBarState extends State<CitiesBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
          builder: (_, state) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: BottomNavigationBar(
                backgroundColor: Colors.white.withOpacity(0.1),
                items: bottomBarItems(),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: _onTapNavigationItem,
                currentIndex: state.index,
                selectedFontSize: 11,
                unselectedItemColor: Colors.red,
                unselectedFontSize: 11,
                elevation: 0,
              ),
            );
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomBarItems() {
    final locale = AppLocalizations.of(context)!;

    List<BottomNavigationBarItem> menuList = <BottomNavigationBarItem>[
      _bottomNavigationBarItem(Assets.franceFlag, locale.paris),
      _bottomNavigationBarItem(Assets.germanyFlag, locale.berlin),
      _bottomNavigationBarItem(Assets.italyFlag, locale.rome)
    ];

    return menuList;
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String asset, String city) {
    const double flagImageScale = 0.8;

    return BottomNavigationBarItem(
      icon: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(asset, scale: flagImageScale),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            city,
            style: const TextStyle(
              letterSpacing: 2.5,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
      label: city,
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(asset, scale: flagImageScale),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              city,
              style: const TextStyle(
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  _onTapNavigationItem(int index) {
    BlocProvider.of<BottomNavigationBarBloc>(context, listen: false).add(
      ChangeTabEvent(
        index: index,
      ),
    );
  }


}
