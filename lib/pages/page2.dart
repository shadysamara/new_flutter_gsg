import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  String title;
  String name;
  Page2(this.title, this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: RaisedButton(child: Text(name), onPressed: () {}),
        ));
  }
}
