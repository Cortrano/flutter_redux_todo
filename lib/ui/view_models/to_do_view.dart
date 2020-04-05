import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_list/actions/to_do_action.dart';
import 'package:redux_list/data/models/to_do_item.dart';
import 'package:redux_list/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_list/ui/widgets/add_item_widget.dart';
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
            child: ItemListWidget(viewModel),
          ),
          RemoveItemsButton(viewModel.onRemoveItems),
        ],
      ),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final _ViewModel model;

  ItemListWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: model.items
          .map((ToDoItem item) => ListTile(
                title: Text(item.body),
                leading: Checkbox(
                  value: item.completed,
                  onChanged: (b) {
                    print('lol');
                    model.onCompleted(item);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => model.onRemoveItem(item),
                ),
              ))
          .toList(),
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
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    _onCompleted(ToDoItem item) {
      store.dispatch(ItemCompletedAction(item));
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
