import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repository/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(Task task) {
    return repository.addTask(task);
  }
}
