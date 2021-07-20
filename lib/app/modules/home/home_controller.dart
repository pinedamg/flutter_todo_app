import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/app/data/models/todo_model.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

class HomeController extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;
  CollectionReference<Map<String, dynamic>> todoCollectionReference =
      FirebaseFirestore.instance.collection('todos');

  @override
  void onInit() {
    // TODO: implement onInit
    todos.bindStream(loadTodos());
    super.onInit();
  }

  Stream<List<Todo>> loadTodos() {
    Stream<QuerySnapshot> stream = todoCollectionReference.snapshots();

    return stream.map(
      (snapshot) => snapshot.docs.map((snap) {
        return Todo(
          name: snap.get('name'),
          description: snap.get('description'),
          date: snap.get('date'),
          active: snap.get('active'),
        );
      }).toList(),
    );
  }
}
