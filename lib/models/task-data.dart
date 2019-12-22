import 'package:flutter/cupertino.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  void addTask(String userTask) {
    if (userTask != null) {
      var newTask = Task(title: userTask);
      _tasks.add(newTask);
      notifyListeners();
      print("addButton" + newTask.title);
    }
  }

//  void removeTask(int index) {
//    tasks.removeAt(index);
//    notifyListeners();
//  }
  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void toggle(Task task, bool value) {
    task.isDone = value;
    notifyListeners();
  }

  List<Task> get tasks => _tasks;
  int get remainingTasks => _tasks.where((i) => i.isDone == false).length;
}
