import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/main.dart';
import 'newtask.dart';
import 'listviewbuilder.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Taskmaster',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          // Filter popup menu
          PopupMenuButton(itemBuilder: (context) {
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
          }, onSelected: (value) {
            context.read<TaskProvider>().setFilter(value);
          }),
        ],
      ),
      // Building the listView
      body: ListViewBuilder(),
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
