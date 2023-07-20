import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_event.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(const BottomNavigationBarInitialState()) {
    on<ChangeTabEvent>((event, emit) => emit(NewTabState(event.index)));
  }
}
