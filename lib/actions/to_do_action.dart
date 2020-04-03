import 'package:redux_list/data/models/to_do_item.dart';

class AddItemAction {
  static int _id = 0;
  final String item;

  AddItemAction(this.item) {
    _id++;
  }

  int get id => _id;
}

class RemoveItemAction {
  final ToDoItem item;

  RemoveItemAction(this.item);
}

class RemoveItemsAction {}
