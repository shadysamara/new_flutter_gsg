import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gsg_flutter/pages/page2.dart';

class Page1 extends StatelessWidget {
  String title;
  Page1(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: RaisedButton(onPressed: () {}),
        ));
  }
}
