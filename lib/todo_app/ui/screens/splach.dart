import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gsg_flutter/todo_app/providers/database_provider.dart';
import 'package:gsg_flutter/todo_app/ui/screens/todo_app.dart';

import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DatabaseProvider>(context).getAllTasks();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return TodoApp();
      }));
    });
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(),
    );
  }
}
