import 'package:flutter/material.dart';

class ButtonMaker extends StatelessWidget {
  final String title;
  final String id;
  final Function press;
  final Color color;
  const ButtonMaker(
      {required this.title,
      required this.id,
      required this.color,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: color,
        onPressed: () {
          OnPressed(id) {}
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 10),
        ));
  }
}
