import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  String label;
  String value;
  Widget icon;
  Function fun;
  ProfileWidget(
      {@required this.label, @required this.value, this.icon, this.fun});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        fun(value);
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(this.label, style: TextStyle(fontSize: 20)),
                    Text(
                      this.value,
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )
                  ],
                ),
              ),
              icon == null ? Container() : icon
            ],
          )),
    );
  }
}
