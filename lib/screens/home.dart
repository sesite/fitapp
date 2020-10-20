import 'package:lesson2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson2/components/workouts-list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        title: Text(title),
        leading: Icon(Icons.emoji_people),
        actions: [
          FlatButton(
            onPressed: () {
              AuthService().logOut();
            },
            //icon: Icon(Icons.logout),
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: WorkOutList(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
              icon: Icon(
                Icons.accessibility,
                color: Colors.black
              ),
              label: 'Мои тренировки'),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.people,
                color: Colors.black),
              label: 'Поиск тренировок'),
        ],
        backgroundColor: Colors.amber,
      ),
    );
  }
}
