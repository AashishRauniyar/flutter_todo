import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:second_project/data/database.dart';
import 'package:second_project/util/dialogue_box.dart';
import 'package:second_project/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _todoBox = Hive.box('todoBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if it is the first time running the app then create default data
    if (_todoBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // if there is data in the box then get it
      db.getData();
    }

    super.initState();
  }

  // controller for text field
  final controller = TextEditingController();

  // list of todo tasks

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateData();
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
      db.updateData();
    });
    Navigator.of(context).pop();
  }

  // create new task method
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    setState(() {});
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 42, 42, 42),
      appBar: AppBar(
        title: const Text(
          "To Do",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
