import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repository/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<Task>> call() {
    return repository.getTasks();
  }
}
