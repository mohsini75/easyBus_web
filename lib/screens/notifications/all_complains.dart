import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybus_web/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({Key? key}) : super(key: key);

  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  DatabaseNotifcation database = new DatabaseNotifcation();
  final Stream<QuerySnapshot> s_db =
      FirebaseFirestore.instance.collection('studentComplains').snapshots();
  final Stream<QuerySnapshot> d_db =
      FirebaseFirestore.instance.collection('driverComplains').snapshots();
  bool check = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Header("All Complaints"),
      SizedBox(height: defaultPadding),
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
              ? database.StreamStudentComplain(
                  s_db, "routeNo", "regNo", "comment")
              : database.StreamDriverComplain(d_db, "regNo", "comment"),
        ),
      )
    ]);
  }
}

class DatabaseNotifcation {
  Widget StreamStudentComplain(Stream<QuerySnapshot> selected, String domain1,
      String domain2, String domain3) {
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
                        leading: Text("Route: ${data.docs[index][domain1]}"),
                        subtitle: Text(
                          "${data.docs[index][domain2]}",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text("${data.docs[index][domain3]}"),
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

  Widget StreamDriverComplain(
      Stream<QuerySnapshot> selected, String domain1, String domain2) {
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
            height: MediaQuery.of(context).size.height * 0.8,
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
                        subtitle: Text("${data.docs[index][domain1]}",
                            style: TextStyle(color: Colors.white)),
                        title: Text("${data.docs[index][domain2]}"),
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
