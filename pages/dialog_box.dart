import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel, });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          children:[
            TextField(
              controller: controller,
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                hintText: "Enter a new task",
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                MyButton(text: "Save", onPressed: onSave),
                // const SizedBox(width:20),
                MyButton(text: "Cancel", onPressed: onCancel)
              ]
            ),
          ],

        )

      )
    );
  }
}
