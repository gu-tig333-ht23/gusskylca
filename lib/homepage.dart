import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'add_task_view.dart';
import 'todobuilder.dart';
import 'no_tasks.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tasks = context.watch<TaskProvider>().myTasks;
    var filter = context.watch<TaskProvider>().chosenFilter;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Taskmaster',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          // Filter popup menu
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PopupMenuButton(
                icon: Icon(Icons.filter_list),
                // Tooltip for opportunity to check current filter
                tooltip: filter,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'all',
                      child: Text('All'),
                    ),
                    PopupMenuItem<String>(
                      value: 'done',
                      child: Text('Done'),
                    ),
                    PopupMenuItem<String>(
                      value: 'undone',
                      child: Text('Undone'),
                    ),
                  ];
                },
                onSelected: (value) {
                  context.read<TaskProvider>().setFilter(value);
                },
              ),
            ],
          ),
        ],
      ),
      // Checking if list of tasks is not empty
      body: tasks.isNotEmpty
          // if not empty, building listview
          ? ListView(children: tasks.map((task) => TodoBuilder(task)).toList())
          // else, building NoTasks
          : NoTasks(),
      // Button to add task
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.green,
        onPressed: () {
          //Navigates to the AddTask view
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskView()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
