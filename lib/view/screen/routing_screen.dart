import 'package:connectify/library.dart';

/// A screen widget for routing.
///
/// This widget represents a screen that can be used for routing purposes.
/// It takes a [child] widget and a [state] of type [GoRouterState].
class RoutingScreen extends StatefulWidget {
  /// Constructs a [RoutingScreen] widget.
  const RoutingScreen({
    required this.child,
    required this.state,
    super.key,
  });

  /// The child widget to be displayed on the screen.
  final Widget child;

  /// The state of the router.
  final GoRouterState state;

  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case User():
            return widget.child;

          case null:
            return const AuthScreen();
        }
      },
    );
  }
}
