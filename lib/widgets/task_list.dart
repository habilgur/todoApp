import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task-data.dart';
import 'package:todo/widgets/task-tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskData>(context);
    return ListView.builder(
      itemCount: taskProvider.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle:
              taskProvider.tasks[index].title, //widget.tasks[index].title,
          isChecked:
              taskProvider.tasks[index].isDone, //widget.tasks[index].isDone,

          toggleCallBack: (value) {
            taskProvider.toggle(taskProvider.tasks[index], value);
          },
          longPressCallBack: () {
            Provider.of<TaskData>(context)
                .removeTask(taskProvider.tasks[index]);
          },
        );
      },
    );
  }
}
