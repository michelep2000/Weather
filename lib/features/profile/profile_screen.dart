import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather_app/features/profile/bloc/profile_bloc.dart';

import '../../design/widgets/assets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode birthDateFocusNode;
  late FocusNode cityFocusNode;
  late AppLocalizations locale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    birthDateFocusNode = FocusNode();
    cityFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.profile),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          bool buttonActive = state.profile?.name != '' &&
              state.profile?.phone != '' &&
              state.profile?.city != '' &&
              state.profile?.email != '' &&
              state.profile?.birthday != '';

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                elevation: 10.0,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundColor: Colors.white60,
                          radius: 50,
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://e7.pngegg.com/pngimages/348/800/png-clipart-man-wearing-blue-shirt-illustration-computer-icons-avatar-user-login-avatar-blue-child.png',
                            ),
                            placeholder: AssetImage(Assets.userPlaceholder),
                            width: 110,
                            height: 110,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Center(
                        child: Column(
                          children: [
                            textFormField(
                              key: locale.name,
                              value: state.profile?.name,
                              myFocusNode: nameFocusNode,
                              onChanged: (value) => context
                                  .read<ProfileBloc>()
                                  .add(NameSetEvent(value)),
                            ),
                            textFormField(
                              key: locale.email,
                              value: state.profile?.email,
                              myFocusNode: emailFocusNode,
                              onChanged: (value) => context
                                  .read<ProfileBloc>()
                                  .add(EmailSetEvent(value)),
                            ),
                            textFormField(
                              key: locale.phone,
                              value: state.profile?.phone,
                              myFocusNode: phoneFocusNode,
                              onChanged: (value) => context
                                  .read<ProfileBloc>()
                                  .add(PhoneSetEvent(value)),
                            ),
                            textFormField(
                              key: locale.city,
                              value: state.profile?.city,
                              myFocusNode: cityFocusNode,
                              onChanged: (value) => context
                                  .read<ProfileBloc>()
                                  .add(CitySetEvent(value)),
                            ),
                            textFormField(
                              key: locale.birthday,
                              value: state.profile?.birthday,
                              myFocusNode: birthDateFocusNode,
                              onChanged: (value) => context
                                  .read<ProfileBloc>()
                                  .add(BirthdaySetEvent(value)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                              ),
                              onPressed: buttonActive ? () {} : null,
                              child: Text(locale.send),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget textFormField({
    required String key,
    String? value,
    required FocusNode myFocusNode,
    required Function(String value) onChanged,
    TextInputType textInputType = TextInputType.text,
    int maxLength = 100,
  }) {
    final textController = TextEditingController(text: value);
    textController.selection =
        TextSelection.collapsed(offset: textController.text.length);

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: TextFormField(
        maxLines: 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: myFocusNode,
        onTap: key == locale.birthday
            ? () async {
                final birthday = await showDatePicker(
                  context: context,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );

                onChanged(
                    '${birthday?.day}/${birthday?.month}/${birthday?.year}');
              }
            : () {},
        controller: textController,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: key,
          counterText: '',
        ),
        keyboardType: textInputType,
      ),
    );
  }
}
