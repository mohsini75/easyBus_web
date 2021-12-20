import 'package:flutter/material.dart';

class view_all_notification extends StatefulWidget {
  const view_all_notification({Key? key}) : super(key: key);

  @override
  _view_all_notificationState createState() => _view_all_notificationState();
}

class _view_all_notificationState extends State<view_all_notification> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Text(
          "Notifications",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
        ),
        Container(
            //width: size.width * 0.7,
            padding: EdgeInsets.only(left: size.width * 0.4, top: 100),
            child: Row(
              children: [
                FlatButton(
                    minWidth: 10,
                    color: Colors.blue[100],
                    onPressed: () {},
                    child: Text(
                      "Driver",
                      style: TextStyle(fontSize: 11),
                    )),
                FlatButton(
                    minWidth: 10,
                    color: Colors.blue[200],
                    onPressed: () {},
                    child: Text(
                      "Student",
                      style: TextStyle(fontSize: 11),
                    )),
                FlatButton(
                    minWidth: 10,
                    color: Colors.blue[300],
                    onPressed: () {},
                    child: Text(
                      "Both",
                      style: TextStyle(fontSize: 11),
                    )),
              ],
            )),

        Container(
          width: size.width * 0.6,
          child: Card(),
        ), //use the card pattern as we use in the app
        ElevatedButton(
          onPressed: () {},
          child: Text("+ Create Notification"),
        )
      ],
    ));
  }
}
