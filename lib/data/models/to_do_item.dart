import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class ToDoItem {
  final String id;
  final String body;
  final bool completed;

  ToDoItem({
    this.id,
    @required this.body,
    this.completed = false,
  });

  ToDoItem copyWith({String id, String body, bool completed}) {
    return ToDoItem(
      id: Uuid().v4() ?? this.id,
      body: body ?? this.body,
      completed: completed ?? this.completed,
    );
  }

  ToDoItem.fromJson(Map<String, dynamic> json)
      : body = json['body'],
        id = json['id'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {
    'id' : (id),
    'body' : body,
    'completed' : completed,
  };
}
