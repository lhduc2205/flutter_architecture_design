library router;

import 'package:architecture_designed/presentation/views/dashboard/dashboard_page.dart';
import 'package:architecture_designed/presentation/views/setting/pages/language_setting_page.dart';
import 'package:architecture_designed/presentation/views/setting/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:architecture_designed/presentation/views/home/home_page.dart';

part 'custom_slide_transition.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigator,
    routes: [
      ShellRoute(navigatorKey: _shellNavigator, builder: (context, state, child) => DashboardPage.routeBuilder(context, state, child), routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage(
            child: HomePage.routeBuilder(context, state),
          ),
        ),
        GoRoute(
            path: '/setting',
            pageBuilder: (context, state) => NoTransitionPage(
                  child: SettingPage.routeBuilder(context, state),
                ),
            routes: [
              GoRoute(
                path: 'language',
                pageBuilder: (context, state) => CustomSlideTransition(
                  child: LanguageSettingPage.routeBuilder(context, state),
                ),
              ),
            ]),
      ]),
    ],
    observers: [],
  );
}
