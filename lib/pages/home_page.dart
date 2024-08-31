import 'package:flutter/material.dart';
import 'package:second_project/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 42, 42, 42),
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(),
          ToDoTile(),
          ToDoTile(),
          ToDoTile(),
        ],
      ),
    );
  }
}
