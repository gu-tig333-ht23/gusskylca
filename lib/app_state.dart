import 'package:flutter/material.dart';
import 'api.dart' as api;
import 'model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskItem> _myTasks = [];
  String _chosenFilter = 'all';

  List<TaskItem> get myTasks {
    switch (_chosenFilter) {
      case 'all':
        return _myTasks;
      case 'done':
        // Checking if the list of filtered tasks is empty
        if (_myTasks.where((element) => element.completed == true).isEmpty) {
          // Setting filter to "all" if empty
          _chosenFilter = 'all';
          return _myTasks;
        } else {
          return _myTasks
              .where((element) => element.completed == true)
              .toList();
        }
      case 'undone':
        // Checking if the list of filtered tasks is empty
        if (_myTasks.where((element) => element.completed == false).isEmpty) {
          // Setting filter to "all" if empty
          _chosenFilter = 'all';
          return _myTasks;
        } else {
          return _myTasks
              .where((element) => element.completed == false)
              .toList();
        }
      default:
        return _myTasks;
    }
  }

  String get chosenFilter => _chosenFilter;

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

// Deleting task from API
  void deleteTask(TaskItem task) async {
    await api.deleteTask(task);
    fetchTasks();
  }

// Toggling task in API
  void toggleTask(task) async {
    await api.toggleTask(task);
    fetchTasks();
  }

//Setting filter
  void setFilter(value) {
    _chosenFilter = value;
    notifyListeners();
  }
}
