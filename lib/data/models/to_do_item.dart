import 'package:flutter/foundation.dart';

class ToDoItem {
  final int id;
  final String body;
  final bool completed;

  ToDoItem({
    @required this.id,
    @required this.body,
    this.completed = false,
  });

  ToDoItem copyWith({int id, String body, bool completed}) {
    return ToDoItem(
      id: id ?? this.id,
      body: body ?? this.body,
      completed: completed ?? this.completed,
    );
  }

  ToDoItem.fromJson(Map json)
      : body = json['body'],
        id = json['id'],
        completed = json['completed'];

  Map toJson() => {
    'id' : (id),
    'body' : body,
    'completed' : completed,
  };
}
