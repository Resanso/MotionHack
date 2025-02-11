import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String? id;
  String title;
  bool isDone;
  DateTime createdAt;

  Todo({
    this.id,
    required this.title,
    this.isDone = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'createdAt': createdAt,
    };
  }

  factory Todo.fromMap(String id, Map<String, dynamic> map) {
    return Todo(
      id: id,
      title: map['title'] ?? '',
      isDone: map['isDone'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
