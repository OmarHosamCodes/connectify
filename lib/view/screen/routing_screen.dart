import 'package:connectify/library.dart';

class RoutingScreen extends StatelessWidget {
  const RoutingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          switch (snapshot.data) {
            case User():
              return const HomeScreen();

            case null:
              return const AuthScreen();
          }
        },
      ),
    );
  }
}
