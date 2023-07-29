part of 'language_switcher_bloc.dart';

@immutable
abstract class LanguageSwitcherEvent {}

class ChangeLanguageEvent extends LanguageSwitcherEvent {
  final String lang;

  ChangeLanguageEvent(this.lang);
}