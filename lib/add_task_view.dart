import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'model.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  final TextEditingController newTaskController = TextEditingController();

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
            // Textfield for describing new tasks
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write Your New Task Here...'),
                controller: newTaskController),
          ),
          // Add task button
          ElevatedButton(
            onPressed: () {
              TaskItem newTask = TaskItem(newTaskController.text, false);
              context.read<TaskProvider>().addTask(newTask);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text(
              'Add Task',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
