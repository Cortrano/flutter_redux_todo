import 'package:redux_list/data/models/to_do_item.dart';
import 'package:uuid/uuid.dart';

class AddItemAction {
  static String _id;
  final ToDoItem item;

  AddItemAction(this.item){
    _id = Uuid().v4();
  }

  String get id => _id;
}

class RemoveItemAction {
  final String id;

  RemoveItemAction(this.id);
}

class ItemCompletedAction {
  final String id;

  ItemCompletedAction(this.id);
}

class RemoveItemsAction {}

class GetItemsAction {}

class LoadedItemsAction {
  final List<ToDoItem> items;

  LoadedItemsAction(this.items);
}

