import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/data/Tasks.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  String? titleError;
  String? descError;

  void createNewTask() {
    final title = _titleController.text.toString();
    final desc = _descController.text.toString();

    setState(() {
      titleError = title.isEmpty ? "Preencha o Título" : null;
      descError = desc.isEmpty ? "Preencha a Descrição" : null;
    });
    
    if (title.isEmpty || desc.isEmpty) { return; }

    final task = Tasks(title: title, description: desc);
    Navigator.pop(context, task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nova Tarefa",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Digite um título",
                  border: OutlineInputBorder(),
                  errorText: titleError,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _descController,
                decoration: InputDecoration(
                  hintText: "Digite uma Descrição",
                  border: OutlineInputBorder(),
                  errorText: descError,
                ),
                maxLines: 6,
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: createNewTask,
                  child: Text(
                    "Criar".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
