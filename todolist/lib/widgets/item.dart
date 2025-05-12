import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/taskprovider.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  const TaskItem({required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _showFullDescription = false;

  void _toggleDescription() {
    setState(() {
      _showFullDescription = !_showFullDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final truncated = task.description.length > 60
        ? '${task.description.substring(0, 60)}...'
        : task.description;

    return GestureDetector(
      onTap: _toggleDescription,
      onLongPress: () {
        Provider.of<TaskProvider>(context, listen: false)
            .removeTask(task.id);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: task.isDone ? Colors.green[100] : Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.indigo.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ← faz o container se ajustar
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration:
                    task.isDone ? TextDecoration.lineThrough : null,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (task.description.isNotEmpty) ...[
              SizedBox(height: 8),
              Text(
                _showFullDescription ? task.description : truncated,
                style: TextStyle(fontSize: 14),
              ),
            ],
            SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                task.isDone
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: task.isDone ? Colors.green : Colors.grey,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
