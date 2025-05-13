class Task {
  final String id;
  String title;  
  String description;
  final DateTime createdAt;
  DateTime? dueDate;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.dueDate,
    this.isDone = false,
  });
}
