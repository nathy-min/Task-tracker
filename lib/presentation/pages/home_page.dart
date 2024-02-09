import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/bloc/task_bloc.dart';
import 'package:todo/presentation/pages/task_page.dart';
import 'package:todo/presentation/widgets/task_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () {
              // TODO: implement alarm functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              // TODO: replace with actual profile picture
              backgroundImage: AssetImage('assets/images/profile_picture.png'),
            ),
            title: Text('Hello, name of the person'),
            subtitle: Text('Today\'s Date'),
          ),
          ListTile(
            title: Text('Today\'s Tasks'),
            trailing: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<TaskBloc>(context),
                    child: TaskPage(),
                  )),
                );
              },
              icon: Icon(Icons.add),
              label: Text('New Task'),
            ),
          ),
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return CircularProgressIndicator();
                } else if (state is TasksLoaded) {
                  return TaskList(tasks: state.tasks);
                } else {
                  return Text('Something went wrong!');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
