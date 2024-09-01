import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  // reference the box
  final _todoBox = Hive.box('todoBox');

  // run if it is the first time ever running the app
  void createInitialData() {
    toDoList = [
      ["Make Bed", false],
      ["Do Pushups", false]
    ];
  }

  // get data from hive box
  void getData() {
    toDoList = _todoBox.get('TODOLIST');
  }

  //update database
  void updateData() {
    _todoBox.put('TODOLIST', toDoList);
  }
}
