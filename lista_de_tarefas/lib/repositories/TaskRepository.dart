
import 'dart:convert';

import 'package:lista_de_tarefas/data/Tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

const listTaskKey = "taskList";

class TaskRepository {

  late final SharedPreferences shared;

  void saveTask(List<Tasks> taskList) async {
    String jsonListTask = jsonEncode(taskList);
    shared.setString(listTaskKey, jsonListTask);
  }

  Future<List<Tasks>> getTasks() async {
    shared = await SharedPreferences.getInstance();
    final listTaskString = shared.getString(listTaskKey);
    List listJson = jsonDecode(listTaskString ?? '[]');
    return listJson.map((e) => Tasks.fromJson(e)).toList();
  }

}