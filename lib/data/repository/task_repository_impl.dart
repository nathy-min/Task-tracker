
import 'package:todo/data/model/task_model.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repository/task_repository.dart';

import '../../data_providers/task_api.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskApi api;

  TaskRepositoryImpl(this.api);

  @override
  Future<List<Task>> getTasks() {
    // Convert the TaskModel objects to Task entities
    return api.getTasks().then((tasks) => tasks.map((task) => Task.fromModel(task)).toList(growable: false) as List<Task>);
  }

  @override
  Future<void> addTask(Task task) {
    // Convert the Task entity to a TaskModel object
    return api.addTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> updateTask(Task task) {
    // Convert the Task entity to a TaskModel object
    return api.updateTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String taskId) {
    return api.deleteTask(taskId);
  }
}
