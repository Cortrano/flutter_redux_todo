import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_list/app_state.dart';
import 'package:redux_list/ui/list_page.dart';
import 'package:redux_list/ui/to_do_page.dart';
import 'reducers/app_state_reducer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store =
      Store<AppState>(appReducer, initialState: AppState.initial());
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Redux List App',
        initialRoute: ListPage.route,
        routes: {
            ListPage.route: (ctx) => ListPage(),
            ToDoPage.route: (ctx) => ToDoPage(),
          },
      ),
    );
  }
}
