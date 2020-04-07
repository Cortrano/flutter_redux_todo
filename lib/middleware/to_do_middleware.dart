import 'dart:async';
import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:redux_list/app_state.dart';
import 'package:redux_list/data/models/to_do_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../actions/to_do_action.dart';

List<Middleware<AppState>> toDoMiddleware([AppState state]) {
  return [
    TypedMiddleware<AppState, GetItemsAction>(
      _loadFromPrefs(),
    ),
    TypedMiddleware<AppState, AddItemAction>(
      _addToPrefs(),
    ),
    TypedMiddleware<AppState, RemoveItemAction>(
      _deleteFromPrefs(),
    ),
    TypedMiddleware<AppState, RemoveItemsAction>(
      _deleteAllPrefs(),
    ),
    TypedMiddleware<AppState, ItemCompletedAction>(
      _updatePrefs(),
    ),
  ];
}

void Function(
  Store<AppState> store,
  GetItemsAction action,
  NextDispatcher next,
) _loadFromPrefs() {
  return (store, action, next) {
    next(action);
    loadFromPrefs()
        .then((state) => store.dispatch(LoadedItemsAction(state.toDoItems)));
  };
}

void Function(
  Store<AppState> store,
  AddItemAction action,
  NextDispatcher next,
) _addToPrefs() {
  return (store, action, next) {
    next(action);
    saveToPrefs(store.state.toDoState);
  };
}

void Function(
  Store<AppState> store,
  ItemCompletedAction action,
  NextDispatcher next,
) _updatePrefs() {
  return (store, action, next) {
    next(action);
    saveToPrefs(store.state.toDoState);
  };
}

void Function(
  Store<AppState> store,
  RemoveItemAction action,
  NextDispatcher next,
) _deleteFromPrefs() {
  return (store, action, next) {
    next(action);
    saveToPrefs(store.state.toDoState);
  };
}

void Function(
  Store<AppState> store,
  RemoveItemsAction action,
  NextDispatcher next,
) _deleteAllPrefs() {
  return (store, action, next) {
    next(action);
    saveToPrefs(store.state.toDoState);
  };
}

void saveToPrefs(ToDoState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<ToDoItem> currentItems = state.toDoItems;
  Map<String, dynamic> currentData = {'items': currentItems};
  var string = json.encode(currentData);
  await preferences.setString('itemState', string);
}

void removeItems(ToDoState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove('itemState');
}

Future<ToDoState> loadFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('itemState');
  if (string != null) {
    List<ToDoItem> loadedItems = [];
    Map<String, dynamic> extractedData = json.decode(string);
    loadedItems = (extractedData['items'] as List)
        .map((i) => ToDoItem.fromJson(i))
        .toList();
    return ToDoState(toDoItems: loadedItems);
  }
  return ToDoState.initial();
}
