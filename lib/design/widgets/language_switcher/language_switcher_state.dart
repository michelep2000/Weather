part of 'language_switcher_bloc.dart';

@immutable
abstract class LanguageSwitcherState {
  final String lang;

  const LanguageSwitcherState({
    required this.lang,
  });
}


class LanguageSwitcherInitialState extends LanguageSwitcherState {
  const LanguageSwitcherInitialState() : super(lang: 'en');
}

class NewLanguageState extends LanguageSwitcherState {
  final String newLang;
  const NewLanguageState(this.newLang) : super(lang: newLang);
}

