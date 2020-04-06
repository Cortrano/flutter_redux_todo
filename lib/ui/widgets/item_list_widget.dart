import 'package:flutter/material.dart';
import 'package:redux_list/data/models/to_do_item.dart';

class ItemListWidget extends StatelessWidget {
  final List<ToDoItem> items;
  final Function(ToDoItem) onDeleted;
  final Function(ToDoItem) onCompleted;
  ItemListWidget(this.items, this.onDeleted, this.onCompleted);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items
          .map((ToDoItem item) => ListTile(
                title: Text(item.body),
                leading: Checkbox(
                  value: item.completed,
                  onChanged: (b) {
                    onCompleted(item);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onDeleted(item),
                ),
              ))
          .toList(),
    );
  }
}