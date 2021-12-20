import 'package:flutter/material.dart';

import 'button.dart';

class Edit_Del_Button extends StatefulWidget {
  final String id;
  final Function onpress;

  Edit_Del_Button({required this.id, required this.onpress});

  @override
  _Edit_Del_ButtonState createState() => _Edit_Del_ButtonState();
}

class _Edit_Del_ButtonState extends State<Edit_Del_Button> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonMaker(
            title: "Edit",
            id: widget.id,
            color: Colors.blue,
            press: widget.onpress),
        ButtonMaker(
            title: "Delete",
            id: widget.id,
            color: Colors.red,
            press: widget.onpress)
      ],
    );
  }
}
