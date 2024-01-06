import 'package:flutter/material.dart';

class DialogCreateTask extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogCreateTask({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: AlertDialog(
        title: Text('Criar uma tarefa'),
        actions: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Digite uma tarefa",
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onSave,
                child: Text('OK'),
              ),
              TextButton(
                onPressed: onCancel,
                child: Text("CANCEL"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
