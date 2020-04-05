import 'package:redux_list/data/models/to_do_item.dart';

class AddItemAction {
  static int _id = 0;
  final String toDoItemBody;

  AddItemAction(this.toDoItemBody) {
    _id++;
  }

  int get id => _id;
}

class RemoveItemAction {
  final ToDoItem toDoItem;

  RemoveItemAction(this.toDoItem);
}

class RemoveItemsAction {}

class GetItemsAction {}

class LoadedItemsAction {
  final List<ToDoItem> items;

  LoadedItemsAction(this.items);
}

class ItemCompletedAction {
  final ToDoItem toDoItem;

  ItemCompletedAction(this.toDoItem);
}