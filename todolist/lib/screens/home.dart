import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/taskprovider.dart';
import '../widgets/item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 100, color: Colors.grey[300]),
                  SizedBox(height: 20),
                  Text(
                    'Nenhuma tarefa por aqui...',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: tasks.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250, // largura máx. do bloco
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 2, // proporção base (ajustável)
                ),
                itemBuilder: (context, index) {
                  return TaskItem(task: tasks[index]);
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addTask'),
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
