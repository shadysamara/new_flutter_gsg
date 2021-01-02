import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/providers/todo_provider.dart';
import 'package:gsg_flutter/todo_app/ui/widgets/todo_widget.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
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
        body: Consumer<TodoProvider>(
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
