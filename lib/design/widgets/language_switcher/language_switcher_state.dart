part of 'language_switcher_bloc.dart';

@immutable
abstract class LanguageSwitcherState {
  final bool isEnglish;

  const LanguageSwitcherState({
    required this.isEnglish,
  });
}


class LanguageSwitcherInitialState extends LanguageSwitcherState {
  const LanguageSwitcherInitialState() : super(isEnglish: true);
}

class NewLanguageState extends LanguageSwitcherState {
  final bool isEnglishChange;
  const NewLanguageState(this.isEnglishChange) : super(isEnglish: isEnglishChange);
}

