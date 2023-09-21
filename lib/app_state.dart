import 'package:flutter/material.dart';
import 'api.dart' as api;
import 'model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskItem> _myTasks = [];
  String chosenFilter = 'all';

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

//Fetching tasks from API
  void fetchTasks() async {
    _myTasks = await api.getTaskItems();
    notifyListeners();
  }

// Adding task to API
  void addTask(TaskItem task) async {
    await api.addTask(task);
    fetchTasks();
  }
// Delete task from API
  void deleteTask(TaskItem task) async {
    await api.deleteTask(task);
    fetchTasks();
  }

  // Toggling task in API
  void toggleTask(task) async {
    await api.toggleTask(task);
    fetchTasks();
  }

//Set filter
  void setFilter(value) {
    chosenFilter = value;
    notifyListeners();
  }
}