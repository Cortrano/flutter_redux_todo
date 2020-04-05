import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_list/actions/list_action.dart';
import 'package:redux_list/app_state.dart';
import 'package:redux_list/data/models/item.dart';

class ListInput extends StatefulWidget {
  @override
  ListInputState createState() => ListInputState();
}

class ListInputState extends State<ListInput> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      
        converter: (store) => _ViewModel.create(store),
        builder: (context, _ViewModel viewModel) => TextField(
            decoration: InputDecoration(hintText: "Enter an Item"),
            controller: controller,
            onSubmitted: (text) {
              viewModel.onAddItem(text);
              controller.text = "";
            }));
  }
}

class ViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, _ViewModel viewModel) => Column(
            children: viewModel.items.map((i) => ListTile(title: Text(i.body))).toList(),
          ),
    );
  }
}

class _ViewModel {
  final List<Item> items;
  final Function onAddItem;
  _ViewModel({this.items, this.onAddItem});

  factory _ViewModel.create(Store<AppState> store)
  {
    _onAddItem(String body){
      store.dispatch(AddAction(body));
    }
    return _ViewModel(items: store.state.listState.items, onAddItem: _onAddItem);
  }
}