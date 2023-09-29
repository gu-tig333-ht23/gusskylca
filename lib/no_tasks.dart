import 'package:flutter/material.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 70),
          child: Text(
            'Wohoo, you have no tasks to do! Great job!',
            style: TextStyle(fontSize: 25),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 90, left: 20, right: 20),
          child: Text(
            'Have something that needs to be done? Add your task by pressing the button:',
            style: TextStyle(fontSize: 18),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
