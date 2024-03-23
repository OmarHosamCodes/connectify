import 'package:connectify/controller/provider/user_provider.dart';
import 'package:connectify/library.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  FirebaseAuth get authInstance => FirebaseAuth.instance;

  //TODO: Implement ProfileScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Color(0xFF0f0f0f),
                      width: 5,
                    ),
                  ),
                ),
                child: CustomImage(
                  source: authInstance.currentUser!.photoURL.toString(),
                  fit: BoxFit.cover,
                  fallbackIcon: Icons.person,
                ),
              ),
              const CustomGap(),
              CustomText(
                text: authInstance.currentUser!.displayName!,
                isHeadline: true,
              ),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final userWatcher = ref.watch(getUserProvider);

                  return userWatcher.when(
                    data: (user) {
                      return CustomText(
                        text: user.userType!.name,
                      );
                    },
                    loading: () => const CustomText(text: ''),
                    error: (error, _) =>
                        const CustomText(text: 'error occurred'),
                  );
                },
              ),
              ListTile(
                title: const CustomText(text: 'Email'),
                subtitle: CustomText(
                  text: authInstance.currentUser!.email!,
                ),
              ),
              const CustomGap(),
              authInstance.currentUser!.phoneNumber != null
                  ? ListTile(
                      title: const CustomText(text: 'Phone Number'),
                      subtitle: CustomText(
                        text: authInstance.currentUser!.phoneNumber!,
                      ),
                    )
                  : const SizedBox(),
              const CustomGap(),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
