part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
  final Profile? profile;

  const ProfileState({required this.profile});

  ProfileSetState copyWith(
          {String? name,
          String? birthday,
          String? phone,
          String? city,
          String? email}) =>
      ProfileSetState(
        newProfile: Profile(
          name: name ?? profile!.name,
          birthday: birthday ?? profile!.birthday,
          phone: phone ?? profile!.phone,
          city: city ?? profile!.city,
          email: email ?? profile!.email,
        ),
      );
}

class ProfileInitialState extends ProfileState {
  ProfileInitialState()
      : super(
          profile: Profile(
            name: '',
            birthday: '',
            phone: '',
            city: '',
            email: '',
          ),
        );
}

class ProfileSetState extends ProfileState {
  final Profile newProfile;

  const ProfileSetState({required this.newProfile})
      : super(profile: newProfile);
}
