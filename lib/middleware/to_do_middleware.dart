import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:redux_list/app_state.dart';
import 'package:redux_list/data/models/to_do_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../actions/to_do_action.dart';

List<Middleware<AppState>> toDoMiddleware() {
  return [
    TypedMiddleware<AppState, AddItemAction>(_saveItem()),
    TypedMiddleware<AppState, RemoveItemAction>(_removeItem()),
    TypedMiddleware<AppState, RemoveItemsAction>(_removeItems()),
    TypedMiddleware<AppState, ItemCompletedAction>(_editItem()),
    TypedMiddleware<AppState, GetItemsAction>(_loadItems()),
  ];
}

void Function(
  Store<AppState> store,
  GetItemsAction action,
  void Function(dynamic) next,
) _loadItems() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<ToDoItem> loadedItems = preferences.getKeys().map((key) {
      Map<String, dynamic> mapItem = json.decode(preferences.getString(key));
      final ToDoItem loadedItem = ToDoItem.fromJson(mapItem);
      print(loadedItem);
      return loadedItem;
    }).toList();

    store.dispatch(LoadedItemsAction(loadedItems));
  };
}

void Function(
  Store<AppState> store,
  AddItemAction action,
  void Function(dynamic) next,
) _saveItem() {
  return (store, action, next) async {
    next(action);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var serializedItem = json.encode(action.item.toJson());
    preferences
        .setString(action.item.id.toString(), serializedItem)
        .then((_) => print('SAVED: ${action.item} '));
  };
}

void Function(
  Store<AppState> store,
  ItemCompletedAction action,
  void Function(dynamic) next,
) _editItem() {
  return (store, action, next) async {
    next(action);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    final updatedToDo = store.state.toDoState.toDoItems
        .firstWhere((item) => item.id == action.id);
    var serializedItem = json.encode(updatedToDo.toJson());
    preferences
        .setString(updatedToDo.id.toString(), serializedItem)
        .then((_) => print('SAVED: $updatedToDo'));
  };
}

void Function(
  Store<AppState> store,
  RemoveItemAction action,
  void Function(dynamic) next,
) _removeItem() {
  return (store, action, next) async {
    next(action);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences
        .remove(action.id.toString())
        .then((_) => print('REMOVED: id#${action.id} '));
  };
}

void Function(
  Store<AppState> store,
  RemoveItemsAction action,
  void Function(dynamic) next,
) _removeItems() {
  return (store, action, next) async {
    next(action);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getKeys().forEach((key) async => await preferences.remove(key));
  };
}
