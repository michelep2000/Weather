part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarState {
  final int index;
  const BottomNavigationBarState({required this.index});
}

class BottomNavigationBarInitialState extends BottomNavigationBarState {
  const BottomNavigationBarInitialState() : super(index: 0);
}

class NewTabState extends BottomNavigationBarState {
  final int newIndex;
  const NewTabState(this.newIndex) : super(index: newIndex);
}