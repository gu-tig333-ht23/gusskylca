import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/main.dart';

class TaskItem {
  // Defining the characteristics of the list objects
  String task;
  bool completed;
  TaskItem(this.task, this.completed);
}

class NoTasks extends StatelessWidget {
  const NoTasks({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 300,
        height: 100,
        child: Text(
          'Wohoo, no tasks to do! Great job!',
          style: TextStyle(fontSize: 25),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskList = context.watch<TaskProvider>().myTasks;
    var isEmpty = taskList.isEmpty;
    switch (isEmpty) {
      case true:
        return NoTasks();
      default:
        return Scaffold(
          // Visualizing tasks from list
          body: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.all(9),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  tileColor: Colors.green,
                  // Checkbox for completing tasks
                  leading: Checkbox(
                    value: taskList[index].completed,
                    onChanged: (bool? newValue) {
                      context.read<TaskProvider>().toggleItem(taskList[index]);
                    },
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        // Task description
                        child: Text(
                          taskList[index].task,
                          style: TextStyle(
                            fontSize: 18,
                            // Cross out task when done
                            decoration: taskList[index].completed
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
                          context.read<TaskProvider>().deleteItem(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
    }
  }
}
