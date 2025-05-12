import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../providers/taskprovider.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(task.description),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          Provider.of<TaskProvider>(context, listen: false)
              .removeTask(task.id);
        },
      ),
      onTap: () {
        Provider.of<TaskProvider>(context, listen: false)
            .toggleTaskStatus(task.id);
      },
    );
  }
}
