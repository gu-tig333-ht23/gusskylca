import 'package:flutter/material.dart';
import 'newtask.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Taskmaster',
          style: TextStyle(fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(
            // Filter button
            onPressed: () {
              showDialog(
                // Filter popup box
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('Filer'),
                    content: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        //Filter icons
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_box_outline_blank),
                              Text('All'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.check_box_outline_blank),
                              Text('Done'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.check_box_outline_blank),
                              Text('Undone'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: ListViewBuilder(), // Button to add task
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            //Navigates to new screen
            context,
            MaterialPageRoute(builder: (context) => const AddTask()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskItem {
  //Class for creating taskitem objects
  String task;
  bool completed;

  TaskItem(this.task, this.completed);
}

class ListViewBuilder extends StatefulWidget {
  ListViewBuilder({Key? key}) : super(key: key);

  @override
  ListViewBuilderState createState() => ListViewBuilderState();
}

class ListViewBuilderState extends State<ListViewBuilder> {
  //List with tasks
  List<TaskItem> tasks = [
    TaskItem("Eat breakfast", false),
    TaskItem("Drink coffee", false),
    TaskItem("Finish the Flutter Course", false),
    TaskItem("Go skiing", false),
    TaskItem("Climb Mont Blanc", false),
    TaskItem("Celebratory beer", false),
  ];

  @override
  Widget build(BuildContext context) {
    // Visualizing tasks from list
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(9),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: Colors.green,
              leading: Checkbox(
                // Checkbox for checking task
                value: tasks[index].completed,
                onChanged: (bool? newValue) {
                  setState(
                    () {
                      tasks[index].completed = newValue!;
                    },
                  );
                },
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      // Task description
                      tasks[index].task,
                      style: TextStyle(
                        fontSize: 18,
                        decoration:
                            tasks[index].completed // Cross out task when done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                        decorationThickness: 4,
                      ),
                    ),
                  ),
                  IconButton(
                    // Close/Delete task button
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(
                        () {
                          tasks.removeAt(index);
                        },
                      );
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
