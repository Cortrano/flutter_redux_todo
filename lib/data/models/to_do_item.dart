import 'dart:math';

import 'package:flutter/foundation.dart';

class ToDoItem {
  final int id;
  final String body;
  final bool completed;

  ToDoItem({
    this.id,
    @required this.body,
    this.completed = false,
  });

  ToDoItem.init({
    @required this.body,
    this.completed = false,
  }) : id = Random().nextInt(100000);

  ToDoItem copyWith({int id, String body, bool completed}) {
    return ToDoItem(
      id: id ?? this.id,
      body: body ?? this.body,
      completed: completed ?? this.completed,
    );
  }

  ToDoItem.fromJson(Map<String, dynamic> json)
      : body = json['body'] as String,
        id = json['id'] as int,
        completed = json['completed'] as bool;

  Map<String, dynamic> toJson() => {
        'id': id,
        'body': body,
        'completed': completed,
      };

  @override
  String toString() {
    String completeMark = completed ? '+' : '-';
    return '($completeMark) ToDo#$id {$body}';
  }
}
