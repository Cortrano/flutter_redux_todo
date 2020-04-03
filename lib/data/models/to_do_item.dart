import 'package:flutter/foundation.dart';

class ToDoItem {
  final int id;
  final String body;

  ToDoItem({
    @required this.id,
    @required this.body,
  });

  ToDoItem copyWith({int id, String body}) {
    return ToDoItem(
      id: id ?? this.id,
      body: body ?? this.body,
    );
  }
}