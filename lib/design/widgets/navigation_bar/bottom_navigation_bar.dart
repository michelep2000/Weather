import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/design/widgets/navigation_bar/bottom_navigation_bar_bloc.dart';

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
        child: BottomAppBar(
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
            builder: (_, state) {
              return BottomNavigationBar(
                backgroundColor: Colors.white,
                items: bottomBarItems(),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: _onTapNavigationItem,
                currentIndex: state.index,
                selectedFontSize: 11,
                unselectedItemColor: Colors.grey,
                unselectedFontSize: 11,
                elevation: 5,
              );
            },
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomBarItems() {
    List<BottomNavigationBarItem> menuList = <BottomNavigationBarItem>[
      _bottomNavigationBarItem(Assets.franceFlag, 'Paris'),
      _bottomNavigationBarItem(Assets.germanyFlag, 'Berlin'),
      _bottomNavigationBarItem(Assets.italyFlag, 'Rome')
    ];

    return menuList;
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String asset, String city) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(asset, scale: 0.9),
          ),
          const SizedBox(height: 5.0,),
          Text(city,
            style: const TextStyle(
                letterSpacing: 2.5, fontWeight: FontWeight.w400),),
        ],
      ),
      label: city,
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey.shade200,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(asset, scale: 0.9),
            ),
            const SizedBox(height: 5.0,),
            Text(city, style: const TextStyle(
                letterSpacing: 2.5, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  _onTapNavigationItem(int index) {
    BlocProvider.of<BottomNavigationBarBloc>(context, listen: false)
        .add(ChangeTabEvent(index));
  }
}
