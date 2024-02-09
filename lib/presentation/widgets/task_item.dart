import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/pages/task_page.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 10,
        color: Color.fromARGB(255, 25, 48, 253),
      ),
      title: Text(
        widget.task.taskName,
        style: TextStyle(
          decoration: _isDone ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.task.description,
        style: TextStyle(
          decoration: _isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: _isDone,
        onChanged: (value) {
          setState(() {
            _isDone = value!;
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskPage(task: widget.task)),
        );
      },
    );
  }
}
