import 'package:flutter/material.dart';
import 'package:second_project/util/my_button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Add a new task"),
            TextField(
                controller: controller,
                decoration:
                    InputDecoration(hintText: "write pending task here")),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(width: 10),
                //cancel
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
