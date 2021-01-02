import 'package:flutter/material.dart';

import '../../models/task_model.dart';

class TodoProvider2 extends ChangeNotifier {
  List<Task> tasks = [
    Task('playing football', true),
    Task('praying aser', false),
    Task('have launch', false),
    Task('studying', false),
    Task('watching tv', false),
    Task('programming', true),
    Task('shopping', true),
  ];
  List<Task> completeTasks = [];
  List<Task> inCompleteTasks = [];

  setAllTasks() {
    completeTasks = tasks.where((task) => task.isComplete).toList();
    inCompleteTasks = tasks.where((task) => !task.isComplete).toList();
    notifyListeners();
  }

  addNewTask(Task task) {
    tasks.add(task);
    setAllTasks();
  }

  deleteTask(Task task) {
    tasks.remove(task);
    setAllTasks();
  }

  editTask(Task task) {
    int index = tasks.indexOf(task);
    tasks[index].isComplete = !tasks[index].isComplete;
    setAllTasks();
  }
}
