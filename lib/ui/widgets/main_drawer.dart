import 'package:flutter/material.dart';
import 'package:redux_list/ui/list_page.dart';
import 'package:redux_list/ui/to_do_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('REDUX'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            onTap: () => {Navigator.of(context).pushReplacementNamed(ListPage.route)},
            title: Text('Redux List'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.check_box),
            onTap: () => {Navigator.of(context).pushReplacementNamed(ToDoPage.route)},
            title: Text('Redux ToDo'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
