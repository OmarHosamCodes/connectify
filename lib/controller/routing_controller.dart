import 'package:connectify/library.dart';
import 'package:connectify/view/screen/search_screen.dart';

class RoutingController {
  static final RoutingController instance = RoutingController();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.home,
    routes: [
      ShellRoute(
          builder: (context, state, child) => RoutingScreen(
                state: state,
                child: child,
              ),
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
            GoRoute(
              path: Routes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: Routes.search,
              builder: (context, state) => const SearchScreen(),
            ),
          ]),
      GoRoute(
        name: Routes.authRoot,
        path: Routes.auth,
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );

  static void go(String route) {
    router.go(route);
  }
}
