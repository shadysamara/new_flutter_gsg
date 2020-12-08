import 'package:flutter/material.dart';

class Assigment2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              color: Colors.red,
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: TabBar(indicatorColor: Colors.blue, tabs: [
                Tab(
                  child: Text('Posts', style: TextStyle(color: Colors.black)),
                ),
                Tab(
                  child: Text('Likes', style: TextStyle(color: Colors.black)),
                )
              ]),
            ),
            Expanded(
              child: TabBarView(children: [
                Center(
                  child: Text('mohammed'),
                ),
                Center(
                  child: Text('Ahmed'),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
