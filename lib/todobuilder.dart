import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'model.dart';

class TodoBuilder extends StatelessWidget {
  final TaskItem task;
  TodoBuilder(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(9),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.green,
        // Checkbox for completing tasks
        leading: Checkbox(
          value: task.completed,
          onChanged: (bool? newValue) {
            context.read<TaskProvider>().toggleTask(task);
          },
        ),
        title: Row(
          children: [
            Expanded(
              // Task description
              child: Text(
                task.task,
                style: TextStyle(
                  fontSize: 18,
                  // Cross out task when done
                  decoration: task.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 4,
                ),
              ),
            ),
            // Delete task button
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Pop up dialog for making sure user wants to delete task
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                          'Are you sure you want to delete "${task.task}"?'),
                      actions: [
                        FilledButton(
                          onPressed: () {
                            context.read<TaskProvider>().deleteTask(task);
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.green),
                          ),
                          child: Text('Yes'),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.green),
                          ),
                          child: Text('No'),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
