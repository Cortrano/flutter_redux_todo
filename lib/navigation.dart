// import 'package:flutter/material.dart';
// import 'package:redux_list/ui/list_page.dart';
// import 'package:redux_list/ui/to_do_page.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final Object args = settings.arguments;
//     switch (settings.name) {
//       case ListPage.route:
//         // return MaterialPageRoute(builder: (context) => InitScreen());
//         return MainRoute(ListPage(), settings: settings);
//       case ToDoPage.route:
//         return MainRoute(ToDoPage(), settings: settings);
//       default:
//         return _generateErrorRoute();
//     }
//   }

//   static Route<dynamic> _generateErrorRoute() {
//     return MaterialPageRoute(builder: (context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('error'),
//         ),
//         body: Center(
//           child: Text('error'),
//         ),
//       );
//     });
//   }
// }

// class MainRoute<T> extends MaterialPageRoute<T> {
//   MainRoute(Widget widget, {RouteSettings settings})
//       : super(
//           //  builder: (_) => RouteAwareWidget(child: widget),
//             settings: settings);

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     if (settings.isInitialRoute) return child;
//     // Fades between routes. (If you don't want any animation,
//     // just return child.)
//     return FadeTransition(opacity: animation, child: child);
//   }
// }

// class FabRoute<T> extends MaterialPageRoute<T> {
//   FabRoute(Widget widget, {RouteSettings settings})
//       : super(
//       //      builder: (_) => RouteAwareWidget(child: widget),
//             settings: settings);

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     if (settings.isInitialRoute) return child;
//     return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0.0, 1.0),
//           end: Offset.zero,
//         ).animate(animation),
//         child: child);
//   }
// }
