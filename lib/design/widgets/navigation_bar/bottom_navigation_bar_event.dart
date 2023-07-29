part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {}

class ChangeTabEvent extends BottomNavigationBarEvent {
  final int index;

  ChangeTabEvent({
    required this.index,
  });
}
