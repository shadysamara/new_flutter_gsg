import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/providers/database_provider.dart';
import 'package:gsg_flutter/todo_app/providers/todo_provider.dart';
import 'package:gsg_flutter/todo_app/ui/screens/new_task_page.dart';
import 'package:gsg_flutter/todo_app/ui/widgets/todo_widget.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewTaskPage();
            }));
          },
        ),
        appBar: AppBar(
          title: Text('TodoApp'),
          bottom: TabBar(tabs: [
            Tab(
              child: Text('All Tasks'),
            ),
            Tab(
              child: Text('Complete Tasks'),
            ),
            Tab(
              child: Text('InComplete Tasks'),
            )
          ]),
        ),
        body: Consumer<DatabaseProvider>(
          builder: (context, value, child) {
            return TabBarView(children: [
              Column(
                children: value.tasks.map((e) => TodoWidget(e)).toList(),
              ),
              Column(
                children:
                    value.completeTasks.map((e) => TodoWidget(e)).toList(),
              ),
              Column(
                children:
                    value.inCompleteTasks.map((e) => TodoWidget(e)).toList(),
              )
            ]);
          },
        ),
      ),
      length: 3,
    );
  }
}
