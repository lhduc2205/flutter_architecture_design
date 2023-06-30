library router;

import 'package:architecture_designed/presentation/views/battery/battery_page.dart';
import 'package:architecture_designed/presentation/views/dashboard/dashboard_page.dart';
import 'package:architecture_designed/presentation/views/home/home_page.dart';
import 'package:architecture_designed/presentation/views/home/pages/local_api_page.dart';
import 'package:architecture_designed/presentation/views/home/pages/remote_api_page.dart';
import 'package:architecture_designed/presentation/views/meal_detail/meal_detail_page.dart';
import 'package:architecture_designed/presentation/views/meal_provider/meal_provider_page.dart';
import 'package:architecture_designed/presentation/views/setting/pages/language_setting_page.dart';
import 'package:architecture_designed/presentation/views/setting/setting_page.dart';
import 'package:architecture_designed/router/router_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'custom_transition.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

GoRouter createRouter() {
  return GoRouter(
    initialLocation: RouterPath.home,
    navigatorKey: _rootNavigator,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) => DashboardPage.routeBuilder(context, state, child),
        routes: [
          GoRoute(
            path: RouterPath.home,
            pageBuilder: (context, state) => NoTransitionPage(
              child: HomePage.routeBuilder(context, state),
            ),
          ),
          GoRoute(
            path: RouterPath.remoteApi,
            pageBuilder: (context, state) => CustomSlideTransition(
              child: RemoteApiPage.routeBuilder(context, state),
            ),
          ),
          GoRoute(
            path: RouterPath.setting,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SettingPage.routeBuilder(context, state),
            ),
          ),
          GoRoute(
            path: RouterPath.language,
            pageBuilder: (context, state) => CustomSlideTransition(
              child: LanguageSettingPage.routeBuilder(context, state),
            ),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RouterPath.localApi,
        pageBuilder: (context, state) => CustomSlideTransition(
          child: LocalApiPage.routeBuilder(context, state),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RouterPath.mealDetail,
        pageBuilder: (context, state) => CustomSlideTransition(
          child: MealDetailPage.routeBuilder(context, state),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RouterPath.battery,
        pageBuilder: (context, state) => CustomFadeTransition(
          child: BatteryPage.routeBuilder(context, state),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RouterPath.mealProvider,
        pageBuilder: (context, state) => CustomSlideTransition(
          child: MealProviderPage.routeBuilder(context, state),
        ),
      ),
    ],
    observers: [],
  );
}
