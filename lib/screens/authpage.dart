import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lesson2/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lesson2/domain/user.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwcontroller = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 50, bottom: 20),
        child: Container(
            child: Align(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        )),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.black87),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white38),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[200], width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                  data: IconThemeData(color: Colors.black87), child: icon),
            ),
          ),
        ),
      );
    }

    Widget _button(String buttonlabel, void func()) {
      return RaisedButton(
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Theme.of(context).primaryColor,
          color: Colors.blue.shade300,
          child: Text(buttonlabel),
          onPressed: () {
            func();
          });
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child:
                  _input(Icon(Icons.email), 'Email', _emailcontroller, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child:
                  _input(Icon(Icons.lock), 'Password', _passwcontroller, true),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _toastMsg(String toastmsg) {
      Fluttertoast.showToast(
          msg: toastmsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    void _loginButtonAction() async {
      _email = _emailcontroller.text;
      _password = _passwcontroller.text;

      if (_email.isEmpty) {
        _toastMsg("Введите Email");

        return null;
      } else if (_password.isEmpty) {
        _toastMsg("Введите пароль");
        return null;
      }

      AppUser user = await _authService.signAppInWithEmailAndPassword(
          _email.trim(), _password.trim());

      if (user == null) {
        _toastMsg("Неверный Email или пароль менее 6 знаков");
      } else {
        _passwcontroller.clear();
        _passwcontroller.clear();
      }
    }

    void _regButtonAction() async {
      _email = _emailcontroller.text;
      _password = _passwcontroller.text;

      if (_email.isEmpty) {
        _toastMsg("Введите Email");

        return null;
      } else if (_password.isEmpty) {
        _toastMsg("Введите пароль");
        return null;
      }

      AppUser user = await _authService.registerAppInWithEmailAndPassword(
          _email.trim(), _password.trim());

      if (user == null) {
        _toastMsg("Неверный Email или пароль менее 6 знаков");
      } else {
        _passwcontroller.clear();
      }
    }

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logo(),
          (showLogin
              ? Column(
                  children: [
                    _form('Login', _loginButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text(
                          'Вы еще не зарегистрировались? Регистрация',
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () {
                          setState(() {
                            showLogin = false;
                          });
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _form('Registration', _regButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text(
                          'Вы уже зарегистрированны? Войти',
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () {
                          setState(() {
                            showLogin = true;
                          });
                        },
                      ),
                    ),
                  ],
                ))
        ],
      ),
    );
  }
}
