import 'package:flutter/material.dart';
import 'package:redux_list/ui/view_models/list_view.dart';
import 'package:redux_list/ui/widgets/main_drawer.dart';

class ListPage extends StatelessWidget {
  static const String route = '/list_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux List"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            ListInput(),
            ViewList(),
          ],
        ),
      ),
    );
  }
}
