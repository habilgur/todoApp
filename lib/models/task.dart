import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  String title;
  bool isDone;
  List<Task> tasks = [];

  Task({this.title, this.isDone = false});
}
