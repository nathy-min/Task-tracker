
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/usecases/get_tasks.dart';
import 'package:todo/domain/usecases/add_task.dart';
import 'package:todo/domain/usecases/update_task.dart';
import 'package:todo/domain/usecases/delete_task.dart';

part 'task_event.dart';
part 'task_state.dart';
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasks getTasks;
  final AddTask addTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;

  TaskBloc({
    required this.getTasks,
    required this.addTask,
    required this.updateTask,
    required this.deleteTask,
  }) : super(TaskLoading()) {
    on<GetTasksEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await getTasks();
        emit(TasksLoaded(tasks));
      } catch (_) {
        emit(TaskError());
      }
    });

    on<AddTaskEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        await addTask(event.task);
        final tasks = await getTasks();
        emit(TasksLoaded(tasks));
      } catch (_) {
        emit(TaskError());
      }
    });

    on<UpdateTaskEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        await updateTask(event.task);
        final tasks = await getTasks();
        emit(TasksLoaded(tasks));
      } catch (_) {
        emit(TaskError());
      }
    });

    on<DeleteTaskEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        await deleteTask(event.taskId);
        final tasks = await getTasks();
        emit(TasksLoaded(tasks));
      } catch (_) {
        emit(TaskError());
      }
    });

    // Automatically trigger the GetTasksEvent when the Bloc is created
    add(GetTasksEvent());
  }
}
