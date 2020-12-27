import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';

class TodoWidget extends StatelessWidget {
  Task task;
  TodoWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.taskName),
        trailing: Checkbox(
          value: task.isComplete,
          onChanged: (value) {
            context.read<TodoProvider>().editTask(task);
          },
        ),
      ),
    );
  }
}
