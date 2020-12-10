import 'package:flutter/material.dart';
import 'package:gsg_flutter/models/task_model.dart';

class CustomDiaoug {
  CustomDiaoug._();
  static final CustomDiaoug customDiaoug = CustomDiaoug._();
  showCustomDialoug(BuildContext context, Function fun, Task task) {
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
                  fun(task);
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
}
