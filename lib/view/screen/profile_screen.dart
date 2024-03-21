import 'package:connectify/library.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  //TODO: Implement ProfileScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          morphingGlassContainer(
              roundedValue: SimpleConstants.radius,
              opacity: 0.4,
              borderColor: Colors.white.withOpacity(0.4),
              child: const Column(
                children: [
                  CustomText(text: 'Username'),
                  CustomGap(),
                  CustomText(text: 'Email'),
                  CustomGap(),
                  CustomText(text: 'More Info')
                ],
              ),
              gradientColors: [Colors.black, Colors.red])
        ],
      )),
    );
  }
}
