import 'package:redux_list/app_state.dart';
import 'package:redux_list/reducers/list_reducer.dart';
import 'package:redux_list/reducers/to_do_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    listState: listReducer(state.listState, action),
    toDoState: toDoReducer(state.toDoState, action),
  );
}