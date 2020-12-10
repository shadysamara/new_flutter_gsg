import 'package:flutter/material.dart';

class Utilities extends StatelessWidget {
  showCustomDialoug(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('You Will Delete A task, are you sure?'),
          actions: [
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  print('user pressed ok');
                }),
            FlatButton(
                child: Text('No'),
                onPressed: () {
                  print('user pressed no');
                })
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () {
          showCustomDialoug(context);
        }),
      ),
    );
  }
}
