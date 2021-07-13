import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.color, this.toDo});
  final String title;
  final Color color;
  final Function toDo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: toDo,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title),
        ),
      ),
    );
  }
}
