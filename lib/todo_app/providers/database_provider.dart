import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:gsg_flutter/todo_app/services/task_db_helper.dart';

class DatabaseProvider extends ChangeNotifier {
  List<Task> tasks = [];
  List<Task> completeTasks = [];
  List<Task> inCompleteTasks = [];

  fillLists(List<Task> tasks) {
    this.tasks = tasks;
    this.completeTasks = tasks.where((element) => element.isComplete).toList();
    this.inCompleteTasks =
        tasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertIntoDatabse(Task task) async {
    await TaskDbHelper.taskDbHelper.insertNewTask(task);
    getAllTasks();
  }

  getAllTasks() async {
    List<Map<String, dynamic>> rows =
        await TaskDbHelper.taskDbHelper.selectAllTasks();
    List<Task> tasks =
        rows != null ? rows.map((e) => Task.fromMap(e)).toList() : [];
    fillLists(tasks);
  }

  updateTask(Task task) async {
    task.isComplete = !task.isComplete;
    await TaskDbHelper.taskDbHelper.updateTask(task);
    getAllTasks();
  }

  deleteTask(Task task) async {
    await TaskDbHelper.taskDbHelper.deleteTask(task.taskId);
    getAllTasks();
  }
}
