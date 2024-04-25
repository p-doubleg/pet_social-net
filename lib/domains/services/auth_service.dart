import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseInstance = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;

  Future<String?> register(
      {required String email, required String password}) async {
    try {
      final credentials =
          await _firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = credentials.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      }
    } catch (e) {
      return 'Try again later';
    }
    return null;
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _user = credentials.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return 'Wrong email or password';
      } else {
        return 'Try again later';
      }
    } catch (e) {
      return 'Try again later';
    }
    return null;
  }

  User? isSingIn() {
    return _firebaseInstance.currentUser;
  }
}
