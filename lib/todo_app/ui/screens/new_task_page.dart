import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:gsg_flutter/todo_app/providers/database_provider.dart';
import 'package:gsg_flutter/todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  bool isComplete = false;

  String taskName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Task name'),
                  onChanged: (value) {
                    taskName = value;
                  },
                ),
              ),
              CheckboxListTile(
                  title: Text('isComplete'),
                  value: isComplete,
                  onChanged: (value) {
                    this.isComplete = value;
                    setState(() {});
                  }),
            ],
          ),
          Container(
            width: 150,
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.blueAccent,
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  Task task = Task(taskName: taskName, isComplete: isComplete);
                  await context
                      .read<DatabaseProvider>()
                      .insertIntoDatabse(task);

                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
