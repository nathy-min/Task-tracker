import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/repository/task_repository_impl.dart';
import 'package:todo/domain/repository/task_repository.dart';
import 'package:todo/domain/usecases/add_task.dart';
import 'package:todo/domain/usecases/delete_task.dart';
import 'package:todo/domain/usecases/get_tasks.dart';
import 'package:todo/domain/usecases/update_task.dart';
import 'package:todo/presentation/bloc/task_bloc.dart';
import 'package:todo/presentation/pages/home_page.dart';

import 'data_providers/task_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskApi taskApi = TaskApi();
    final TaskRepository taskRepository = TaskRepositoryImpl(taskApi);

    return BlocProvider(
      create: (context) => TaskBloc(
        getTasks: GetTasks(taskRepository),
        addTask: AddTask(taskRepository),
        updateTask: UpdateTask(taskRepository),
        deleteTask: DeleteTask(taskRepository),
      ),
      child: MaterialApp(
        title: 'Task Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

