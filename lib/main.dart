import 'dart:ui';
/* import 'package:firebase_auth/firebase_auth.dart'; */
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lesson2/screens/landing.dart';
import 'package:lesson2/services/auth.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(
            'Что-то пошло не так.',
            textDirection: TextDirection.ltr,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<AppUser>.value(
            value: AuthService().currentUser,
            child: MaterialApp(
              title: 'Fit',
              theme: ThemeData(
                primaryColor: Colors.amber,
                primarySwatch: Colors.blue,
                textTheme: TextTheme(headline6: TextStyle(color: Colors.pink)),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: LandingPage(title: 'Fit Center'),
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: Container(
            color: Colors.black,
            child: Text(
              'Ждите, идет загрузка',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textDirection: TextDirection.ltr,
            ),
          ),
        );
      },
    );
  }
}
