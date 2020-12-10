import 'package:flutter/material.dart';
import 'package:gsg_flutter/models/task_model.dart';
import 'package:gsg_flutter/todo_app/tasks_mock.dart';

/// 1- create state => class extends StatefulWidget
///

class MyPage extends StatefulWidget {
  String userName = 'shady';
  MyPage({this.userName});

  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  bool isAccepted = false;
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  List names = ['ameer', 'omair', 'osama', 'wsam'];
  int bnbIndex = 0;
  toggleTaskStatus(Task task, bool newState) {
    int taskIndex = tasks.indexOf(task);
    tasks[taskIndex].isComplete = newState;
    setState(() {});
  }

  removeTask(Task task) {
    tasks.remove(task);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('hello from build');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                tabController.animateTo(1);
              })
        ],
        title: Text(widget.userName),
        bottom: TabBar(controller: tabController, tabs: [
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
      body: TabBarView(controller: tabController, children: [
        Column(
          children: tasks
              .map((e) => TodoWidget(e, toggleTaskStatus, removeTask))
              .toList(),
        ),
        Column(
          children: tasks
              .where((element) => element.isComplete == true)
              .map((e) => TodoWidget(e, toggleTaskStatus, removeTask))
              .toList(),
        ),
        Column(
          children: tasks
              .where((element) => !element.isComplete)
              .map((e) => TodoWidget(e, toggleTaskStatus, removeTask))
              .toList(),
        )
      ]),
    );
  }
}

class TodoWidget extends StatefulWidget {
  Task task;
  Function fun;
  Function deleteFun;
  TodoWidget(this.task, this.fun, this.deleteFun);
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                widget.deleteFun(widget.task);
              }),
          Text(widget.task.taskName),
          Checkbox(
              value: widget.task.isComplete,
              onChanged: (value) {
                widget.task.isComplete = value;

                widget.fun(widget.task, value);
                setState(() {});
              })
        ],
      ),
    );
  }
}
