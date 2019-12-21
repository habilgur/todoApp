import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/add-task-screen.dart';
import 'package:todo/widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 80,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Todoey",
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                    "You Have ${tasks.where((i) => i.isDone == false).length} Tasks",
                    style: TextStyle(fontSize: 23, color: Colors.white)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TaskList(tasks: tasks),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return AddTaskScreen(
                  createTaskCallBack: (userTask) {
                    if (userTask != null) {
                      var newTask = Task(title: userTask);
                      setState(() {
                        tasks.add(newTask);
                      });
                      Navigator.pop(context);
                      print("addButton" + newTask.title);
                    }
                  },
                );
              });
        },
      ),
    );
  }
}
