class Task {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.isDone = false,
  });
}
