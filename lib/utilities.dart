import 'package:flutter/material.dart';

class Utilities extends StatelessWidget {
  Future<bool> showCustomDialoug(BuildContext context) async {
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
                  Navigator.pop(context);
                  return true;
                }),
            FlatButton(
                child: Text('No'),
                onPressed: () {
                  print('no');
                  return false;
                })
          ],
        );
      },
    );
  }

  showCustomSnackbar(String content, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return RaisedButton(onPressed: () async {
              showCustomSnackbar('my first snackbar in flutter', context);
            });
          },
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  showCustomSnackbar(String content, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(onPressed: () async {
      showCustomSnackbar('my first snackbar in flutter', context);
    });
  }
}
