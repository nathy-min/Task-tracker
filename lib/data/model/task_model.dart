import 'package:todo/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String id,
    required String taskName,
    required String description,
    required DateTime createdAt,
  }) : super(
          id: id,
          taskName: taskName,
          description: description,
          createdAt: createdAt,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      taskName: json['taskName'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      taskName: task.taskName,
      description: task.description,
      createdAt: task.createdAt,
    );
  }

  
}
