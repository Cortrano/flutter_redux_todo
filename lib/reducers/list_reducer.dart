import 'package:redux_list/actions/list_action.dart';
import 'package:redux_list/app_state.dart';
import 'package:redux_list/data/models/item.dart';
import 'package:redux/redux.dart';

Reducer<ListState> listReducer = combineReducers<ListState>([
  TypedReducer<ListState, AddAction>(addListItemReducer),
]);

ListState addListItemReducer(ListState state, action) {
    return ListState(
        items: []
          ..addAll(state.items)
          ..add(Item(body: action.item)));
}