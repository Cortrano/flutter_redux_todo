import 'package:redux_list/data/models/to_do_item.dart';

class AddItemAction {
  ToDoItem item;

  AddItemAction(this.item);

  int get id => item.id;
}

class RemoveItemAction {
  final int id;

  RemoveItemAction(this.id);
}

class ItemCompletedAction {
  final int id;

  ItemCompletedAction(this.id);
}

class RemoveItemsAction {}

class GetItemsAction {}

class LoadedItemsAction {
  final List<ToDoItem> items;

  LoadedItemsAction(this.items);
}
