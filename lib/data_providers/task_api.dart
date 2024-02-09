import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/data/model/task_model.dart';

class TaskApi {
  final String baseUrl = 'https://65bca57db51f9b29e931efdb.mockapi.io/api/k1/Task';

  Future<List<TaskModel>> getTasks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => TaskModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> addTask(TaskModel task) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: task.toJson(),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add task');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${task.id}'),
      body: task.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(String taskId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/tasks/$taskId'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }
}
