import 'package:connectify/library.dart';
import 'package:connectify/view/screen/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

//TODO implement cliking on search open search screen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Connectify',

      // home: SearchScreen(),
      routerConfig: RoutingController.router,
    );
  }
}
