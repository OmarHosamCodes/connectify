import 'package:connectify/library.dart';

class UserController {
  FirebaseAuth get authInstants => FirebaseAuth.instance;

  FirebaseFirestore get firestoreInstants => FirebaseFirestore.instance;

  FirebaseStorage get storageInstants => FirebaseStorage.instance;

  User? get currentUser => authInstants.currentUser;
  Future<UserModel> getUser() async {
    final user = await firestoreInstants
        .collection('users')
        .doc(currentUser!.uid)
        .get()
        .then((value) => UserModel.fromJson(value.data()!));
    return user;
  }
}
