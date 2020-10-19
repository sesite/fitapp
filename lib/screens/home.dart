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
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(
                Icons.filter_hdr_outlined,
                color: Colors.black,
              ),
              label: 'Мои тренировки'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Поиск тренировок'),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
