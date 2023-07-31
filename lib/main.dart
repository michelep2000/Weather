import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather_app/features/profile/bloc/profile_bloc.dart';

import 'package:weather_app/l10n/l10n.dart';
import 'package:weather_app/provider/open_weather_provider.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:weather_app/repository/weather_repository_implementation.dart';
import 'package:weather_app/design/widgets/navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:weather_app/design/widgets/language_switcher/language_switcher_bloc.dart';
import 'package:weather_app/features/profile/profile_screen.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/weather_screen.dart';
import 'package:weather_app/routes.dart';

void main() {
  final weatherProvider = OpenWeatherProvider();
  final weatherRepository = WeatherRepositoryImplementation(weatherProvider);

  runApp(
    RepositoryProvider<WeatherRepositoryBase>(
      create: (_) => weatherRepository,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => WeatherBloc(context.read<WeatherRepositoryBase>())),
        BlocProvider(create: (_) => ProfileBloc()),
        BlocProvider(create: (_) => BottomNavigationBarBloc()),
        BlocProvider(create: (_) => LanguageSwitcherBloc()),
      ],
      child: BlocBuilder<LanguageSwitcherBloc, LanguageSwitcherState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: Routes.weather,
            routes: Routes.getRoutes(),
            locale: Locale(state.lang),
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
