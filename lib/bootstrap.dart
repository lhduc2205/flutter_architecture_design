import 'dart:async';

import 'package:architecture_designed/app/app.dart';
import 'package:architecture_designed/global/bloc_observer.dart';
import 'package:architecture_designed/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    sl<Logger>().e(details.exceptionAsString(), 'Bootstrap error', details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      if (kReleaseMode) {
        sl<Logger>().w('App started with release mode!', 'Release mode');
      }

      runApp(const MyApp());
    },
    (error, stackTrace) {
      sl<Logger>().e(error.toString(), '', stackTrace);
    },
  );
}
