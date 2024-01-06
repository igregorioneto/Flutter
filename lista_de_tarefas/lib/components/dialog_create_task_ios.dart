import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogCreateTaskIos extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogCreateTaskIos({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Criar uma tarefa'),
      content: Card(
        elevation: 0.0,
        child: Column(
          children: [
            CupertinoTextField(
              controller: controller,
              placeholder: "Digite uma tarefa",
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text("OK"),
          onPressed: onSave,
        ),
        CupertinoDialogAction(
          child: Text("CANCEL"),
          onPressed: onCancel,
        ),
      ],
    );
  }
}
