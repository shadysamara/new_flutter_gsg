import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gsg_flutter/models/task_model.dart';
import 'package:gsg_flutter/todo_app/new_task_page.dart';
import 'package:gsg_flutter/todo_app/tasks_mock.dart';
import 'package:gsg_flutter/utilities/custom_drawer.dart';
import 'package:gsg_flutter/utilities/dialougs.dart';

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

  showCustomDialoug(BuildContext context, Task task) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('You Will Delete A task, are you sure?'),
          actions: [
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  removeTask(task);
                  Navigator.pop(context);
                }),
            FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  toggleTaskStatus(Task task, bool newState) {
    int taskIndex = tasks.indexOf(task);
    tasks[taskIndex].isComplete = newState;
    setState(() {});
  }

  removeTask(Task task) {
    tasks.remove(task);
    setState(() {});
  }

  allCompleteFunction() {
    tabController.animateTo(0);
    Navigator.pop(context);
  }

  CompleteFunction() {
    tabController.animateTo(1);
    Navigator.pop(context);
  }

  inCompleteFunction() {
    tabController.animateTo(2);
    Navigator.pop(context);
  }

  thisSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Get.to(NewTaskPage(thisSetState));
        },
      ),
      // endDrawer: Drawer(
      //   child: Column(
      //     children: [
      //       Text('child1'),
      //       Text('child1'),
      //       Text('child1'),
      //       Text('child1'),
      //       Text('child1'),
      //       Text('child1'),
      //     ],
      //   ),
      // ),
      drawerEnableOpenDragGesture: false,
      drawer: CustomDrawer(
        fun1: allCompleteFunction,
        fun2: CompleteFunction,
        fun3: inCompleteFunction,
      ),
      appBar: AppBar(
        title: Text('Todo '),
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
              .map((e) => TodoWidget(e, toggleTaskStatus, showCustomDialoug))
              .toList(),
        ),
        // ListView.separated(
        //   separatorBuilder: (context, index) {
        //     return Divider();
        //   },
        //   itemCount: tasks.length,
        //   itemBuilder: (context, index) {
        //     return TodoWidget(
        //         tasks[index], toggleTaskStatus, showCustomDialoug);
        //   },
        // ),
        Column(
          children: tasks
              .where((element) => element.isComplete == true)
              .map((e) => TodoWidget(e, toggleTaskStatus, showCustomDialoug))
              .toList(),
        ),
        Column(
          children: tasks
              .where((element) => !element.isComplete)
              .map((e) => TodoWidget(e, toggleTaskStatus, showCustomDialoug))
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
                widget.deleteFun(context, widget.task);
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
