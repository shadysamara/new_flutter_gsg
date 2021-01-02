import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:gsg_flutter/todo_app/providers/database_provider.dart';
import 'package:gsg_flutter/todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  Task task;
  TodoWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.taskName),
        leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              context.read<DatabaseProvider>().deleteTask(task);
            }),
        trailing: Checkbox(
          value: task.isComplete,
          onChanged: (value) {
            context.read<DatabaseProvider>().updateTask(task);
          },
        ),
      ),
    );
  }
}
