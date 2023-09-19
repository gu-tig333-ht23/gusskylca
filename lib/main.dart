import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'listviewbuilder.dart';

// Provider for changing states and functionality
class TaskProvider extends ChangeNotifier {
  final List<TaskItem> _myTasks = [];
  String chosenFilter = 'all';

  // Get filtered tasklist
  List<TaskItem> get myTasks {
    switch (chosenFilter) {
      case 'all':
        return _myTasks;
      case 'done':
        return _myTasks.where((element) => element.completed == true).toList();
      case 'undone':
        return _myTasks.where((element) => element.completed == false).toList();
      default:
        return _myTasks;
    }
  }

  void setFilter(value) {
    chosenFilter = value;
    notifyListeners();
  }

  void addItem(item) {
    _myTasks.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _myTasks.removeAt(index);
    notifyListeners();
  }

  void toggleItem(TaskItem item) {
    if (item.completed == true) {
      item.completed = false;
    } else {
      (item.completed = true);
    }
    notifyListeners();
  }
}

void main() {
  TaskProvider state = TaskProvider();
  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
