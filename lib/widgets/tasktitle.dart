import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final bool values;
  final String text;
  final Function onPressed, longPress;
  TaskTitle({this.values, this.text, this.onPressed, this.longPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress,
      title: Text(
        text,
        style: TextStyle(
            decoration:
                values ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: values,
        activeColor: Colors.lightBlueAccent,
        onChanged: onPressed,
      ),
    );
  }
}
