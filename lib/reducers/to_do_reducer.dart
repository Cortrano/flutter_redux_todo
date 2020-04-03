import 'package:redux_list/app_state.dart';
import 'package:redux_list/data/models/to_do_item.dart';
import '../actions/to_do_action.dart';

ToDoState toDoReducer(ToDoState state, action) {
  if (action is AddItemAction) {
    return ToDoState(
        toToItems: []
          ..addAll(state.toToItems)
          ..add(ToDoItem(id: action.id, body: action.item)));
  }

  if (action is RemoveItemAction) {
    return ToDoState(
        toToItems:
            List.unmodifiable(List.from(state.toToItems)..remove(action.item)));
  }

  if (action is RemoveItemsAction) {
    return ToDoState(toToItems: List.unmodifiable([]));
  }

  return state;
}
