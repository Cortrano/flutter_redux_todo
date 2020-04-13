import 'package:redux_list/app_state.dart';
import '../actions/to_do_action.dart';
import 'package:redux/redux.dart';

Reducer<ToDoState> toDoReducer = combineReducers<ToDoState>([
  TypedReducer<ToDoState, AddItemAction>(addItemReducer),
  TypedReducer<ToDoState, RemoveItemAction>(removeItemReducer),
  TypedReducer<ToDoState, RemoveItemsAction>(removeItemsReducer),
  TypedReducer<ToDoState, LoadedItemsAction>(loadItemsReducer),
  TypedReducer<ToDoState, ItemCompletedAction>(itemCompletedReducer),
]);

ToDoState addItemReducer(ToDoState state, AddItemAction action) {
  return ToDoState(
      toDoItems: []
        ..addAll(state.toDoItems)
        ..add(action.item));
}

ToDoState removeItemReducer(ToDoState state, RemoveItemAction action) {
  final existingToDoIndex =
      state.toDoItems.indexWhere((item) => item.id == action.id);
  return ToDoState(
      toDoItems: List.unmodifiable(
          List.from(state.toDoItems)..removeAt(existingToDoIndex)));
}

ToDoState itemCompletedReducer(ToDoState state, ItemCompletedAction action) {
  final existingToDo =
      state.toDoItems.firstWhere((item) => item.id == action.id);
  return ToDoState(
      toDoItems: state.toDoItems
          .map((item) => item.id == existingToDo.id
              ? item.copyWith(completed: !item.completed)
              : item)
          .toList());
}

ToDoState removeItemsReducer(ToDoState state, RemoveItemsAction action) {
  return ToDoState(toDoItems: List.unmodifiable([]));
}

ToDoState loadItemsReducer(ToDoState state, LoadedItemsAction action) {
  return ToDoState(toDoItems: action.items);
}
