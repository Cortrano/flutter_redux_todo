import 'package:flutter/foundation.dart';

class Item {
  final String body;

  Item({
    @required this.body,
  });

  Item copyWith(String body) {
    return Item(
      body: body ?? this.body,
    );
  }
}