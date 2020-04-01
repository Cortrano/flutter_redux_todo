import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './actions.dart';

class ListState {
  final List<String> items;
  ListState({this.items});

  ListState.initialState() : items = [];
}

ListState reducer(ListState state, action) {
  if (action is AddAction) {
    return ListState(
        items: []
          ..addAll(state.items)
          ..add(action.input));
  }
}