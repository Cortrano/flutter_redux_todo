import 'dart:async';
import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:redux_list/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../actions/to_do_action.dart';

List<Middleware<AppState>> toDoMiddleware([AppState state]) {
  final loadItems = _loadFromPrefs(state);
  final saveItems = _saveToPrefs(state);

  return[
    TypedMiddleware<AppState, AddItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemsAction>(saveItems),
    TypedMiddleware<AppState, ItemCompletedAction>(saveItems),
    TypedMiddleware<AppState, GetItemsAction>(loadItems),
  ];
}

Middleware<AppState> _loadFromPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next){
    next(action);
    loadFromPrefs().then((state) => store.dispatch(LoadedItemsAction(state.toDoItems)));
  };
}

Middleware<AppState> _saveToPrefs(AppState state) {
    return (Store<AppState> store, action, NextDispatcher next){
    next(action);
    saveToPrefs(store.state.toDoState);
  };
}

void saveToPrefs(ToDoState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await preferences.setString('itemState', string);
}

Future<ToDoState> loadFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('itemState');
  if (string != null){
    Map map = json.decode(string);
    return ToDoState.fromJson(map);
  }
  return ToDoState.initial();
}

