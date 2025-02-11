import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo.dart';

class FirebaseService {
  final CollectionReference _todosCollection =
      FirebaseFirestore.instance.collection('todos');

  Stream<List<Todo>> getTodos() {
    return _todosCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Todo.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> addTodo(String title) async {
    await _todosCollection.add({
      'title': title,
      'isDone': false,
      'createdAt': DateTime.now(),
    });
  }

  Future<void> toggleTodo(String id, bool isDone) async {
    await _todosCollection.doc(id).update({'isDone': isDone});
  }

  Future<void> deleteTodo(String id) async {
    await _todosCollection.doc(id).delete();
  }
}
