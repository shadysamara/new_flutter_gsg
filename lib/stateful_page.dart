import 'package:flutter/material.dart';
import 'package:gsg_flutter/models/task_model.dart';
import 'package:gsg_flutter/tasks_mock.dart';

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

  int bnbIndex = 0;
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
          children: tasks.map((e) => TodoWidget(e)).toList(),
        ),
        Column(
          children: tasks
              .where((element) => element.isComplete == true)
              .map((e) => TodoWidget(e))
              .toList(),
        ),
        Column(
          children: tasks
              .where((element) => !element.isComplete)
              .map((e) => TodoWidget(e))
              .toList(),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabController.index,
          onTap: (value) {
            tabController.animateTo(value);
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(label: 'AllTasks', icon: Icon(Icons.menu)),
            BottomNavigationBarItem(
                label: 'Complete Tasks', icon: Icon(Icons.done)),
            BottomNavigationBarItem(
                label: 'InComplete tasks', icon: Icon(Icons.close)),
            BottomNavigationBarItem(label: 'AllTasks', icon: Icon(Icons.menu)),
            BottomNavigationBarItem(
                label: 'Complete Tasks', icon: Icon(Icons.done)),
            BottomNavigationBarItem(
                label: 'InComplete tasks', icon: Icon(Icons.close)),
          ]),
    );
  }
}

class TodoWidget extends StatefulWidget {
  Task task;
  Function fun;
  TodoWidget(this.task, {this.fun});
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: '5'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.task.taskName),
          Checkbox(
              value: widget.task.isComplete,
              onChanged: (value) {
                widget.task.isComplete = value;
                setState(() {});
              })
        ],
      ),
    );
  }
}
// class TermsWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return TermsWidgetState();
//   }
// }

// class TermsWidgetState extends State<TermsWidget> {
//   bool isAccepted = false;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('Accept All Terms'),
//           Checkbox(
//             value: isAccepted,
//             onChanged: (value) {
//               this.isAccepted = value;
//               setState(() {});
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
// class StatelessTest extends StatelessWidget {
//   String userName = 'shady';
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('StatefulWidget'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(this.userName,
//               textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
//           RaisedButton(
//               child: Text(
//                 'change my name',
//                 style: TextStyle(fontSize: 20),
//               ),
//               onPressed: () {
//                 this.userName = 'mohannad';
//               }),
//           RaisedButton(
//               child: Text(
//                 'print my name',
//                 style: TextStyle(fontSize: 20),
//               ),
//               onPressed: () {
//                 print(this.userName);
//               })
//         ],
//       ),
//     );
//   }
// }
