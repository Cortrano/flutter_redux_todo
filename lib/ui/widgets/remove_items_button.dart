import 'package:flutter/material.dart';

class RemoveItemsButton extends StatelessWidget {
  final Function onPressed;
  RemoveItemsButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete all Items'),
      onPressed: () => onPressed(),
    );
  }
}