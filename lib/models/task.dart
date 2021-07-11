class Task {
  String id;
  String description;
  bool completed;

  Task(
    this.id,
    this.description,
    this.completed,
  );

  /// convert objet JSON to Objet Dart
  factory Task.fromJson(Map<String, dynamic> jsonTask) {
    return Task(
      jsonTask['_id'].toString(),
      jsonTask['description'].toString(),
      jsonTask['completed'],
    );
  }
}

// {
//   'key': value
// }
