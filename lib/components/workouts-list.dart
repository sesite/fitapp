import 'package:flutter/material.dart';
import 'package:lesson2/domain/workout.dart';

class WorkOutList extends StatelessWidget {
  final workouts = <WorkOut>[
    WorkOut(
        title: 'Бег на улице',
        author: 'Europa',
        description: 'Бег на открытом воздухе для сжигания каллорий',
        level: 'Новичок',
        icon: Icon(Icons.directions_run)),
    WorkOut(
        title: 'Плавание',
        author: 'Fit',
        description: 'Плание в бассейне 25 метров свободным стилем',
        level: 'Средний',
        icon: Icon(Icons.pool)),
    WorkOut(
        title: 'Беговая дорожка',
        author: 'ExtremmFit',
        description: 'Бег на беговой дорожке в помещении с Таськой',
        level: 'Экстремально',
        icon: Icon(Icons.directions_bike)),
    WorkOut(
        title: 'Свободная тренировка',
        author: 'Home',
        description: 'Зарядка на каждое утро',
        level: 'Новичок',
        icon: Icon(Icons.favorite_outlined)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/fitbg.jpg'),
          ),
        ),
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(color: Colors.amber.shade200),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: workouts[i].icon,
                  ),
                  title: Text(workouts[i].title),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  subtitle: subTitle(context, workouts[i]),
                ),
              ),
            );
          },
        ));
  }
}

Widget subTitle(BuildContext context, WorkOut workout) {
  var color = Colors.grey;
  double indicatorlevel = 0;

  switch (workout.level) {
    case 'Новичок':
      color = Colors.green;
      indicatorlevel = 0.33;
      break;
    case 'Средний':
      color = Colors.orange;
      indicatorlevel = 0.66;
      break;
    case 'Экстремально':
      color = Colors.red;
      indicatorlevel = 1;
      break;
  }
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          value: indicatorlevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 3,
        child: Text(workout.level),
      ),
    ],
  );
}
