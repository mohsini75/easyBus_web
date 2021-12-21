import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybus_web/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  StudentScreen({Key? key}) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<DataRow> _buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = data;

    return DataRow(cells: [
      DataCell(Text(record.get('name'))),
      DataCell(Text(record.get('regNo'))),
      DataCell(Text(record.get('email'))),
      DataCell(Text(record.get('contact'))),
      DataCell(Text(record.get('routeNo'))),
      DataCell(
        Container(
          height: 8,
          width: 70,
          //color: Colors.green,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: record.get('feeClearance') == "true"
                  ? Colors.green
                  : Colors.red),
        ),
      ),
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
        Header("Registered Students"),
        SizedBox(height: defaultPadding),
        Container(
          height: size.height * 0.8,
          width: size.width * 0.9,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('role', isEqualTo: "student")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return DataTable(columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Reg No')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Contact')),
                DataColumn(label: Text('Route #')),
                DataColumn(label: Text('Fee Clearance')),
                //DataColumn(label: Text('Actions')),
              ], rows: _buildList(context, snapshot.data!.docs));
            },
          ),
        ),
      ],
    );
  }
}
