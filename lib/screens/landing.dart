import 'package:flutter/material.dart';
import 'package:lesson2/domain/user.dart';
import 'package:lesson2/screens/authpage.dart';
import 'package:lesson2/screens/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final AppUser user = Provider.of<AppUser>(context);
    bool islogin = user != null;

    return islogin ? MyHomePage(title: title) : AuthorizationPage(title: title);
  }
}
