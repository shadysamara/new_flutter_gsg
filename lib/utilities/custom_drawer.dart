import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  bool isTabPage;
  Function fun1;
  Function fun2;
  Function fun3;
  CustomDrawer({this.fun1, this.fun2, this.fun3});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              accountName: Text('Wesam Salama'),
              accountEmail: Text('wesam@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/van.jpg'),
              )),
          ListTile(
            onTap: () {
              fun1();
            },
            title: Text('All Tasks'),
            subtitle: Text('all tasks i have'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              fun2();
            },
            title: Text('Complete Tasks'),
            subtitle: Text('all tasks i have already done'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              fun3();
            },
            title: Text('InComplete Tasks'),
            subtitle: Text('all tasks i have not  done'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Spacer(),
          ListTile(
            onTap: () {},
            title: Text('Logout'),
            trailing: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
