import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseInstance = FirebaseAuth.instance;

  void register({required String email, required String password}) async {
    var credential;
    try {
      credential = await _firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    print(credential);
  }

  void login({required String email, required String password}) async {
    var credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    print(credential);
  }
}
