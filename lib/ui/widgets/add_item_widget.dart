import 'package:flutter/material.dart';

class AddItemWidget extends StatefulWidget {
  final Function(String input) onSubmitted;
  AddItemWidget(this.onSubmitted);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Enter ToDo',
      ),
      onSubmitted: (String s) {
        widget.onSubmitted(s);
        controller.text = '';
      },
    );
  }
}
