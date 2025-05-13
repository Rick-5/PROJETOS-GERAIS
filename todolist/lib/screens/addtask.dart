import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/taskprovider.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? existingTask;

  const AddTaskScreen({this.existingTask});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      _titleController.text = widget.existingTask!.title;
      _descriptionController.text = widget.existingTask!.description;
      _dueDate = widget.existingTask!.dueDate;
    }
  }

  void _selectDueDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (selectedDate != null) {
      setState(() => _dueDate = selectedDate);
    }
  }

  void _saveTask() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final provider = Provider.of<TaskProvider>(context, listen: false);

    if (widget.existingTask != null) {
      provider.updateTask(
        widget.existingTask!.id,
        title,
        _descriptionController.text,
        _dueDate,
      );
    } else {
      provider.addTask(Task(
        id: DateTime.now().toString(),
        title: title,
        description: _descriptionController.text,
        createdAt: DateTime.now(),
        dueDate: _dueDate,
      ));
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingTask != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Tarefa' : 'Nova Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: _selectDueDate,
              child: AbsorbPointer(
                child: TextField(
                  controller: TextEditingController(
                    text: _dueDate != null
                        ? _dueDate!.toLocal().toString().split(' ')[0]
                        : '',
                  ),
                  decoration: InputDecoration(labelText: 'Prazo'),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveTask,
                icon: Icon(Icons.save),
                label: Text(isEditing ? 'Atualizar' : 'Salvar'),
              ),
            ),
            if (isEditing) ...[
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<TaskProvider>(context, listen: false)
                        .removeTask(widget.existingTask!.id);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete),
                  label: Text('Excluir'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}