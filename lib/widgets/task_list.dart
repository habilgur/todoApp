import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/task-tile.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList({this.tasks});
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].title,
          isChecked: widget.tasks[index].isDone,
          toggleCallBack: (value) {
            setState(() {
              widget.tasks[index].toggle();
              //Alt=> userTasks[index].isDone=value,;
            });
          },
        );
      },
    );
  }
}
