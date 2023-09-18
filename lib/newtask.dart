import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  //Class for adding new task
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Add New Task',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              // Creating textfield
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write Your New Task Here...'),
            ),
          ),
          ElevatedButton(
            // Add task button
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text(
              'Add Task',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
