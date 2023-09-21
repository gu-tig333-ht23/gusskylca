import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;

// API URL
const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
// API KEY
const String apiKey = 'e0cacf7a-82bf-43f2-a329-e91bac501431';

Future<List<TaskItem>> getTaskItems() async {
  http.Response response =
      await http.get(Uri.parse('$ENDPOINT/todos?key=$apiKey'));
  String body = response.body;
  List<dynamic> jsonResponse = jsonDecode(body);
  return jsonResponse.map((json) => TaskItem.fromJson(json)).toList();
}

Future<void> addTask(TaskItem task) async {
  await http.post(
    Uri.parse('$ENDPOINT/todos?key=$apiKey'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(
      task.toJson(),
    ),
  );
}

Future<void> deleteTask(TaskItem task) async {
  var id = task.id;
  await http.delete(
    Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'),
  );
}

Future<void> toggleTask(TaskItem task) async {
  var id = task.id;
  task.completed = !task.completed;
  await http.put(
    Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(
      task.toJson(),
    ),
  );
}
