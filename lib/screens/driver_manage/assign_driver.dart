import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybus_web/screens/dashboard/components/header.dart';
import 'package:easybus_web/screens/driver_manage/driver_signup.dart';
import 'package:flutter/material.dart';

import 'edit_del_button.dart';

class AssignDriverScreen extends StatefulWidget {
  const AssignDriverScreen({Key? key}) : super(key: key);

  @override
  _AssignDriverScreenState createState() => _AssignDriverScreenState();
}

class _AssignDriverScreenState extends State<AssignDriverScreen> {
  List<DataRow> _buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = data;

    return DataRow(cells: [
      DataCell(Text(record.get('name'))),
      DataCell(Text(record.get('cnic'))),
      DataCell(Text(record.get('contact'))),
      DataCell(Text(record.get('routeNo'))),
      DataCell(Text(record.get('vehicle'))),
    ]);
  }

  @override
  double defaultPadding = 16;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    floatingActionButtonLocation:
    FloatingActionButtonLocation.centerFloat;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Header("Assigned Drivers"),
        SizedBox(height: defaultPadding),
        FloatingActionButton.extended(
          onPressed: () {
            showDialog(context: context, builder: (context) => DriverSignUp());
          },
          label: Row(
            children: [
              Icon(Icons.add),
              Text("Add Driver"),
            ],
          ),
        ),
        Container(
          height: size.height * 0.8,
          width: size.width * 0.9,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('role', isEqualTo: "driver")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return DataTable(columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('CNIC')),
                DataColumn(label: Text('Contact')),
                DataColumn(label: Text('Route')),
                DataColumn(label: Text('Vehicle')),
                //DataColumn(label: Text('Actions')),
              ], rows: _buildList(context, snapshot.data!.docs));
            },
          ),
        ),
      ],
    );
  }
}
