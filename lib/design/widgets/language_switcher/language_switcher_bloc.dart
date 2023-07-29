
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_switcher_event.dart';

part 'language_switcher_state.dart';

class LanguageSwitcherBloc
    extends Bloc<LanguageSwitcherEvent, LanguageSwitcherState> {
  LanguageSwitcherBloc() : super(const LanguageSwitcherInitialState()) {
    on<ChangeLanguageEvent>((event, emit) => emit(NewLanguageState(event.lang)));
  }
}
