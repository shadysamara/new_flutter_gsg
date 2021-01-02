import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gsg_flutter/todo_app/delteted/file_helper.dart';
import 'package:gsg_flutter/todo_app/services/db_helper.dart';
import 'package:gsg_flutter/todo_app/delteted/sp_helper.dart';

class SharedTest extends StatelessWidget {
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () async {
          DBHelper.dbHelper.getAllDataFromDatabase();
        }),
      ),
    );
  }
}
