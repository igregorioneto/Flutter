import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/dialog_create_task_android.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List rowList = [];

  final _controller = TextEditingController();

  void addNewTask() {
    setState(() {
      rowList.add(RowList(title: _controller.text,));
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void dialogCreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogCreateTask(
          controller: _controller,
          onSave: addNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarefas para hoje",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: dialogCreateNewTask,
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: rowList.length,
        itemBuilder: (context, index) => rowList[index],
      ),
    );
  }
}

class RowList extends StatefulWidget {
  final title;
  bool checked;

  RowList({super.key, required this.title, this.checked = false});

  @override
  State<RowList> createState() => _RowListState();
}

class _RowListState extends State<RowList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: widget.checked ? Icon(Icons.check) : null,
      onTap: () {
        setState(() {
          widget.checked = !widget.checked;
        });
      },
    );
  }
}
