import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/dialog_create_task_android.dart';
import 'package:lista_de_tarefas/data/Tasks.dart';
import 'package:lista_de_tarefas/pages/new_task_page.dart';
import 'package:lista_de_tarefas/repositories/TaskRepository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskRepository repository = TaskRepository();
  List<Tasks> rowList = [];

  @override
  void initState() {
    repository.getTasks().then((value) => rowList.addAll(value));
  }

  // final _controller = TextEditingController();

  /*void addNewTask() {
    setState(() {
      rowList.add(RowList(
        title: _controller.text,
      ));
      _controller.clear();
    });
    Navigator.of(context).pop();
  }*/

  void dialogCreateNewTask(context) {
    /*showDialog(
      context: context,
      builder: (context) {
        return DialogCreateTask(
          controller: _controller,
          onSave: addNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );*/
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewTaskPage()))
        .then(
          (task) => {
            setState(() {
              if (task != null) {
                rowList.add(task);
                _saveList();
              }
            })
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarefas para hoje",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dialogCreateNewTask(context),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: rowList.length,
        itemBuilder: (context, index) {
          final task = rowList[index];
          return RowList(
            task: task,
            onDeleteItem: () => _deleteTask(index, task, context),
            onValueChange: () {
              setState(() {
                rowList[index].isDone = !rowList[index].isDone;
                _saveList();
              });
            },
          );
        },
      ),
    );
  }

  void _deleteTask(int index, Tasks task, BuildContext context) {
    setState(() {
      rowList.removeAt(index);
      _saveList();

      final snackBar = SnackBar(
        content: Text("Tarefa ${task.title} excluida!"),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              rowList.insert(index, task);
              _saveList();
            });
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _saveList() {
    repository.saveTask(rowList);
  }
}

class RowList extends StatefulWidget {
  final Tasks task;
  VoidCallback onDeleteItem;
  VoidCallback onValueChange;

  RowList({
    super.key,
    required this.task,
    required this.onDeleteItem,
    required this.onValueChange,
  });

  @override
  State<RowList> createState() => _RowListState();
}

class _RowListState extends State<RowList> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => widget.onDeleteItem,
      background: Container(
        color: Colors.red,
        child: Align(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          alignment: Alignment.centerRight,
        ),
      ),
      child: ListTile(
        title: Text(widget.task.title),
        subtitle: Text(widget.task.description),
        trailing: widget.task.isDone ? Icon(Icons.check) : null,
        onTap: () {
          setState(() {
            widget.task.isDone = !widget.task.isDone;
            widget.onValueChange;
          });
        },
      ),
    );
  }
}
