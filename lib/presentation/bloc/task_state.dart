part of 'task_bloc.dart';

@immutable
abstract class TaskState {}



class TaskLoading extends TaskState {}

class TasksLoaded extends TaskState {
  final List<Task> tasks;

  TasksLoaded(this.tasks);
}

class TaskError extends TaskState {}
