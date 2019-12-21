import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/tasks-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TasksScreen();

    /// Provider Sample....
//      return ChangeNotifierProvider<Data>(
//      create: (context) => Data(),
//      child: MaterialApp(
//        home: Level(),
//      ),
//    );
  }
}

/// Provider Sample....
class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<Data>(context).data),
      ),
      body: Level1(),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Level3(),
        Text(Provider.of<Data>(context).data),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        Provider.of<Data>(context).changeText(value);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = "the data";

  void changeText(String value) {
    data = value;
    notifyListeners();
  }
}
