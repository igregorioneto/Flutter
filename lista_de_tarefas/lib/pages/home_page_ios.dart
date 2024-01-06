import 'package:flutter/cupertino.dart';
import 'package:lista_de_tarefas/components/dialog_create_task_ios.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [];

  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      todoList.add(
        RowList(title: _controller.text),
      );
      _controller.clear();
    });
    Navigator.pop(context);
  }

  void dialogCreateTask() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return DialogCreateTaskIos(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Tarefas para hoje",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        trailing: CupertinoButton(
          onPressed: dialogCreateTask,
          child: Icon(CupertinoIcons.add),
          padding: EdgeInsets.zero,
        ),
      ),
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return todoList[index];
        },
      ),
    );
  }
}

class RowList extends StatefulWidget {
  final title;
  bool checked;

  RowList({
    super.key,
    required this.title,
    this.checked = false,
  });

  @override
  State<RowList> createState() => _RowListState();
}

class _RowListState extends State<RowList> {
  void changedTask() {
    setState(() {
      widget.checked = !widget.checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changedTask,
      child: CupertinoListTile(
        title: Text(widget.title),
        trailing: widget.checked ? Icon(CupertinoIcons.check_mark) : null,
      ),
    );
  }
}
