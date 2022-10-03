import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkbox_state.dart';

class AddToDo extends StatelessWidget {
  AddToDo({required this.toDoList});
  Set<CheckBoxState> toDoList;
  TextEditingController titleController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Nuevo Item"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Título"),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    toDoList.add(CheckBoxState(title: titleController.text));
                    Navigator.of(context).pop();
                  },
                  child: Text("Guardar")),
            )
          ],
        ));
  }
}
