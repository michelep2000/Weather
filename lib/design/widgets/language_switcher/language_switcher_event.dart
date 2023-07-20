part of 'language_switcher_bloc.dart';

@immutable
abstract class LanguageSwitcherEvent {}

class ChangeLanguageEvent extends LanguageSwitcherEvent {
  final bool isEnglish;

  ChangeLanguageEvent(this.isEnglish);
}