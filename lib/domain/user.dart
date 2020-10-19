import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String id;

  AppUser.fromFirebase(User user) {
    id = user.uid;
  }
}
