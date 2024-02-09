import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repository/task_repository.dart';

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<void> call(Task task) {
    return repository.updateTask(task);
  }
}
