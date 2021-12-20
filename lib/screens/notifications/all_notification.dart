import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybus_web/screens/dashboard/components/header.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AllNotificationScreen extends StatefulWidget {
  AllNotificationScreen({Key? key}) : super(key: key);

  @override
  _AllNotificationScreenState createState() => _AllNotificationScreenState();
}

class _AllNotificationScreenState extends State<AllNotificationScreen> {
  DatabseNotifcation database = new DatabseNotifcation();
  final Stream<QuerySnapshot> s_db =
      FirebaseFirestore.instance.collection('studentNotifications').snapshots();
  final Stream<QuerySnapshot> d_db =
      FirebaseFirestore.instance.collection('driverNotifications').snapshots();

  int togValue = 0;
  bool check = true;
  final textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;

  CollectionReference add_Student_notification =
      FirebaseFirestore.instance.collection('studentNotifications');
  CollectionReference add_Driver_notification =
      FirebaseFirestore.instance.collection('driverNotifications');
  CollectionReference add_Both_notification =
      FirebaseFirestore.instance.collection('bothNotifi');
  void showDailog(String meassage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error Message'),
        content: Text(meassage),
        actions: [
          FlatButton(
            child: Text("okay"),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    try {
      if (!_formKey.currentState!.validate()) {
        // Invalid!
        return;
      }
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      // await Provider.of<Auth>(context, listen: false)
      //     .signup(_authData['email'], _authData['password']);
    } on Exception catch (error) {
      showDailog(error.toString());
    } catch (error) {
      showDailog(error.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white10,
            content: SingleChildScrollView(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(
                        0.8, 0.0), // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Colors.purple.shade200,
                      Colors.blue.shade200
                    ], // red to yellow
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Notifications ",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white),
                          ),
                        ]),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Colors.purple,
                      height: 4.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            controller: textController,
                            validator: (val) {
                              if (val!.isEmpty || val == null) {
                                return "Cannot be empty";
                              }
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: 8,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type notification'),
                            onSaved: (val) {
                              textController.text = val!;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    ToggleSwitch(
                      minWidth: 130.0,
                      minHeight: 40,
                      initialLabelIndex: 0,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 3,
                      icons: [
                        Icons.person,
                        Icons.settings_accessibility,
                        Icons.people
                      ],
                      iconSize: 30.0,
                      borderWidth: 2.0,
                      borderColor: [Colors.blueGrey],
                      activeBgColors: const [
                        [Colors.blue],
                        [Colors.pink],
                        [Colors.purple]
                      ],
                      onToggle: (index) {
                        togValue = index;
                        print('switched to: $index');
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Text(
                            "Create Notification", textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                            //textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () => {
                              if (togValue == 0)
                                {
                                  addNotiStudent(),
                                  Navigator.of(context).pop(),
                                  textController.clear(),
                                  _submit(),
                                }
                              else if (togValue == 1)
                                {
                                  addNotiDriver(),
                                  Navigator.of(context).pop(),
                                  textController.clear(),
                                  _submit(),
                                }
                              else
                                {
                                  addNotiBoth(),
                                  Navigator.of(context).pop(),
                                  textController.clear(),
                                  _submit(),
                                }
                            }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> addNotiStudent() {
    print("add studentr wali sideea gai haaa");
    // Call the user's CollectionReference to add a new user
    print(textController.text);
    return add_Student_notification
        .add(
            {"message": textController.text, "date": DateTime.now().toString()})
        .then((value) => print("notification Added student"))
        .catchError((error) => print("Failed to add : $error"));
  }

  Future<void> addNotiDriver() {
    print("add driver wali sideea gai haaa");
    // Call the user's CollectionReference to add a new user
    return add_Driver_notification
        .add(
            {"message": textController.text, "date": DateTime.now().toString()})
        .then((value) => print("notification Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addNotiBoth() {
    print("add both wali sideea gai haaa");
    // Call the user's CollectionReference to add a new user
    return add_Both_notification
        .add({"message": textController.text})
        .then((value) => print("notification Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    floatingActionButtonLocation:
    FloatingActionButtonLocation.centerFloat;
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Header("Notifications"),
        SizedBox(height: defaultPadding),
        FloatingActionButton.extended(
          onPressed: () => openAlertBox(),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.add),
              Text(" create Notification"),
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                check = true;
              });
            },
            child: Text("Student")),
        TextButton(
            onPressed: () {
              setState(() {
                check = false;
              });
            },
            child: Text("Driver")),
        SingleChildScrollView(
          child: Container(
            height: size.height * 0.7,
            child: check
                ? database.StreamCommon(s_db, "message", "date")
                : database.StreamCommon(d_db, "message", "date"),
          ),
        )
        // Container(
        //   height: MediaQuery.of(context).size.height * 0.7,
        //   child: database.StreamCommon(
        //       s_db,"message"),
        // ),
        // Container(
        //   height: MediaQuery.of(context).size.height * 0.7,
        //   child: database.StreamCommon(
        //       d_db, "message"),
        // ),
      ],
    );
  }
}

class DatabseNotifcation {
  Widget StreamCommon(
      Stream<QuerySnapshot> selected, String domain, String date) {
    return StreamBuilder<QuerySnapshot>(
        stream: selected,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Text("Something went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
          }
          final data = snapshot.requireData;
          print("data require ho gaya ha ");
          return Container(
            height: MediaQuery.of(context).size.height * 1,
            child: ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        subtitle: Text(
                          "${data.docs[index][date]}",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text("${data.docs[index][domain]}"),
                      ),
                    ),
                  ],
                );
                // ma ye kaaha raha ho driver ka na show ho par jab add karo tu error na dee bas DB me save ho jai
              },
            ),
          );
        });
  }
}
