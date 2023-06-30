import 'package:architecture_designed/core/enums/supported_languages.dart';
import 'package:architecture_designed/global/language_manager.dart';
import 'package:architecture_designed/presentation/bloc/meal_provider/meal_provider_bloc.dart';
import 'package:architecture_designed/presentation/bloc/photo/photo_bloc.dart';
import 'package:architecture_designed/presentation/widgets/app_snack_bar.dart';
import 'package:architecture_designed/router/router.dart';
import 'package:architecture_designed/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    this.router,
  });

  final GoRouter? router;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final router = widget.router ?? createRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LanguageManager>()),
        BlocProvider(create: (_) => sl<MealProviderBloc>()),
        BlocProvider(create: (_) => sl<PhotoBloc>()..add(const LoadMorePhotosEvent())),
      ],
      child: BlocBuilder<LanguageManager, SupportedLanguageType>(
        builder: (context, languageType) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: scaffoldMessengerKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              appBarTheme: const AppBarTheme(
                centerTitle: true,
              ),
              bottomAppBarTheme: const BottomAppBarTheme(
                surfaceTintColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                centerTitle: true,
              ),
              useMaterial3: true,
              brightness: Brightness.dark,
            ),
            locale: Locale(languageType.name),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
