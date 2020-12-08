import 'package:flutter/material.dart';
import 'package:gsg_flutter/tasks_mock.dart';

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
        body: TabBarView(children: [
          Column(
            children: tasks.map((e) => Text(e.taskName)).toList(),
          ),
          Column(
            children: tasks
                .where((element) => element.isComplete == true)
                .map((e) => Text(e.taskName))
                .toList(),
          ),
          Column(
            children: tasks
                .where((element) => !element.isComplete)
                .map((e) => Text(e.taskName))
                .toList(),
          )
        ]),
      ),
      length: 3,
    );
  }
}
