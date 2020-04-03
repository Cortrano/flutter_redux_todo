import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_list/app_state.dart';
import 'package:redux_list/data/models/to_do_item.dart';
import 'package:redux_list/ui/widgets/main_drawer.dart';
import 'view_models/to_do_view.dart';

class ToDoPage extends StatelessWidget {
  static const String route = '/to_do_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux ToDo'),
      ),
      drawer: MainDrawer(),
      body: ToDoView(),
    );
  }
}



