import 'package:connectify/library.dart';

final userControllerProvider = Provider<UserController>((ref) {
  return UserController();
});

final getUserProvider = FutureProvider<UserModel>((ref) {
  final userController = ref.watch(userControllerProvider);
  return userController.getUser();
});
