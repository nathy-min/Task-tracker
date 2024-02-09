import '../../data/model/task_model.dart';

class Task {
  final String id;
  final String taskName;
  final String description;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.taskName,
    required this.description,
    required this.createdAt,
  });

  
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
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

  factory Task.fromModel(TaskModel model) {
    return Task(
      id: model.id,
      taskName: model.taskName,
      description: model.description,
      createdAt: model.createdAt,
    );
  }
}
