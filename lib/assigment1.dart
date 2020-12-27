import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_flutter/widgets/profile_widget.dart';

class Assigment1 extends StatelessWidget {
  nameFunction(String value) {
    print('hello my name is $value');
  }

  addressFunction(String value) {
    print('my address is $value');
  }

  emailFunction(String value) {
    print('you can email me on $value');
  }

  mobileFunction(String value) {
    print('you can call me on $value');
  }

  birthDataFunction(String value) {
    print('hello my birthdate is $value');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Edit Profile'),
        trailing: Text(
          'Save',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: 200,
            ),
            Divider(),
            ProfileWidget(
              label: 'Name',
              value: 'Linda I. Hartz',
              fun: nameFunction,
            ),
            Divider(),
            ProfileWidget(
              label: 'Address',
              value: 'Khalifa Park, Abu Dhabi, UAE',
              fun: addressFunction,
            ),
            Divider(),
            ProfileWidget(
              label: 'Email',
              value: 'Linda@host.com',
              icon: Icon(Icons.message),
              fun: emailFunction,
            ),
            Divider(),
            ProfileWidget(
              label: 'Mobile',
              value: '009715932145654',
              fun: mobileFunction,
            ),
            Divider(),
            ProfileWidget(
              label: 'BirthDate',
              value: '15-JAN-1990',
              icon: Icon(Icons.calendar_today),
              fun: birthDataFunction,
            )
          ],
        ),
      ),
    );
  }
}
