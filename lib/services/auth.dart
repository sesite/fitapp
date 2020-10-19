import 'package:firebase_auth/firebase_auth.dart';
import 'package:lesson2/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<AppUser> signAppInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return AppUser.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AppUser> registerAppInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return AppUser.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<AppUser> get currentUser {
    return _fAuth.authStateChanges().map((User user) {
      if (user == null) {
        print('User is currently signed out!');
        return null;
      } else {
        print('User is signed in!');
        return AppUser.fromFirebase(user);
      }
    });
  }
}
