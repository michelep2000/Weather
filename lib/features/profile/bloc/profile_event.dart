part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {
  const ProfileEvent();
}


class ProfileSetEvent extends ProfileEvent {
  final Profile profile;

  const ProfileSetEvent(this.profile);
}

class NameSetEvent extends ProfileEvent {
  final String name;

  const NameSetEvent(this.name);
}

class EmailSetEvent extends ProfileEvent {
  final String email;

  const EmailSetEvent(this.email);
}

class PhoneSetEvent extends ProfileEvent {
  final String phone;

  const PhoneSetEvent(this.phone);
}

class CitySetEvent extends ProfileEvent {
  final String city;

  const CitySetEvent(this.city);
}

class BirthdaySetEvent extends ProfileEvent {
  final String birthday;

  const BirthdaySetEvent(this.birthday);
}
