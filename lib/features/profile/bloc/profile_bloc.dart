import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/my_profile.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<EmailSetEvent>(_emailSetEvent);
    on<NameSetEvent>(_nameSetEvent);
    on<PhoneSetEvent>(_phoneSetEvent);
    on<CitySetEvent>(_citySetEvent);
    on<BirthdaySetEvent>(_birthdaySetEvent);
  }

  void _emailSetEvent(EmailSetEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _nameSetEvent(NameSetEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _phoneSetEvent(PhoneSetEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  void _citySetEvent(CitySetEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(city: event.city));
  }

  void _birthdaySetEvent(BirthdaySetEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(birthday: event.birthday));
  }
}
