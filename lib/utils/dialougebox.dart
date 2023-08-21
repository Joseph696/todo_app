import 'package:flutter/material.dart';
import 'package:todo_app/utils/mybutton.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[100],
      content: Container(
        height: 120,
        color: Colors.green[100],
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(onpressed:onSave, text: "Save"),
                const SizedBox(
                  width: 8,
                ),
                MyButton(onpressed: onCancel, text: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}
