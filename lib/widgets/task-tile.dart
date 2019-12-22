import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function toggleCallBack;
  final Function longPressCallBack;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.toggleCallBack,
      this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longPressCallBack,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: toggleCallBack,
        ));
  }
}
