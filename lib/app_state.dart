import 'package:flutter/foundation.dart';
import 'package:redux_list/data/models/item.dart';
import 'package:redux_list/data/models/to_do_item.dart';

class AppState {
  final ListState listState;
  final ToDoState toDoState;

  AppState({
    @required this.listState,
    @required this.toDoState,
  });

  factory AppState.initial() {
    return AppState(
      listState: ListState.initial(),
      toDoState: ToDoState.initial(),
    );
  }
}

class ListState {
  final List<Item> items;
  ListState({this.items});

  ListState.initial() : items = [];
}

class ToDoState {
  final List<ToDoItem> toDoItems;
  const ToDoState({this.toDoItems});

  ToDoState.initial() : toDoItems = <ToDoItem>[];
}
