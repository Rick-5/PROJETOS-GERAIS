import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/taskprovider.dart';
import '../models/task.dart';
import '../widgets/item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              return TaskItem(task: taskProvider.tasks[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTask');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
