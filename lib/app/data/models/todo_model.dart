import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// Dart Model of todo item from and to json
class Todo {
  String? name;
  String? description;
  bool? active;
  Timestamp? date;

  Todo({
    this.name,
    this.description,
    this.active,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'active': active,
      'date': date,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      name: map['name'],
      description: map['description'],
      active: map['active'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
