import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_list/actions/to_do_action.dart';
import 'package:redux_list/app_state.dart';
import 'package:redux_list/middleware/to_do_middleware.dart';
import 'package:redux_list/ui/list_page.dart';
import 'package:redux_list/ui/to_do_page.dart';
import 'reducers/app_state_reducer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: toDoMiddleware(),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Redux List App',
        initialRoute: ToDoPage.route,
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(GetItemsAction()),
          builder: (BuildContext context, Store<AppState> store) =>
              ToDoPage(store),
        ),
        routes: {
          ListPage.route: (ctx) => ListPage(),
          ToDoPage.route: (ctx) => ToDoPage(store),
        },
      ),
    );
  }
}
