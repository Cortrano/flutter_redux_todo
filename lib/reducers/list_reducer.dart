import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_list/app_state.dart';
import '../actions/list_action.dart';

ListState listReducer(ListState state, action) {
  if (action is AddAction) {
    return ListState(
        items: []
          ..addAll(state.items)
          ..add(action.item));
  }
}