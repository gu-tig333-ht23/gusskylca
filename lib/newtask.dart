import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/main.dart';
import 'listviewbuilder.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  final TextEditingController textEditingController = TextEditingController();

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
                controller: textEditingController),
          ),
          // Add task button
          ElevatedButton(
            onPressed: () {
              var newTask = TaskItem(textEditingController.text, false);
              context.read<TaskProvider>().addItem(newTask);
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
