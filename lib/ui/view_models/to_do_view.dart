import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_list/actions/to_do_action.dart';
import 'package:redux_list/data/models/to_do_item.dart';
import 'package:redux_list/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_list/ui/widgets/add_item_widget.dart';
import 'package:redux_list/ui/widgets/item_list_widget.dart';
import 'package:redux_list/ui/widgets/remove_items_button.dart';

class ToDoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel viewModel) => Column(
        children: <Widget>[
          AddItemWidget(viewModel.onAddItem),
          Expanded(
            child: ItemListWidget(
              viewModel.items,
              viewModel.onRemoveItem,
              viewModel.onCompleted,
            ),
          ),
          RemoveItemsButton(viewModel.onRemoveItems),
        ],
      ),
    );
  }
}

class _ViewModel {
  final List<ToDoItem> items;
  final Function(ToDoItem) onCompleted;
  final Function(String) onAddItem;
  final Function(ToDoItem) onRemoveItem;
  final Function() onRemoveItems;

  _ViewModel({
    this.items,
    this.onCompleted,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(ToDoItem item) {
      store.dispatch(RemoveItemAction(item.id));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    _onCompleted(ToDoItem item) {
      store.dispatch(ItemCompletedAction(item.id));
    }

    return _ViewModel(
      items: store.state.toDoState.toDoItems,
      onCompleted: _onCompleted,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
    );
  }
}
