import 'package:connectify/library.dart';

class RoutingController {
  static final RoutingController instance = RoutingController();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.routing,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.routing,
        builder: (context, state) => const RoutingScreen(),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );

  static void go(String route) {
    router.go(route);
  }
}
