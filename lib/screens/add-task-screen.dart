import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function createTaskCallBack;

  AddTaskScreen({this.createTaskCallBack});

  @override
  Widget build(BuildContext context) {
    String userTask;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                  autofocus: true, // Keybordu çıkartır..
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Add a Task",
                  ),
                  onChanged: (value) {
                    userTask = value;
                    print(userTask);
                  }),
              FlatButton(
                color: Colors.lightBlue,
                child: Text("Add"),
                onPressed: () {
                  createTaskCallBack(userTask);
                },

                ///userTask bu function içinden ulaşılabilir.
//                onPressed: () {
//                  print(userTask);
//                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
