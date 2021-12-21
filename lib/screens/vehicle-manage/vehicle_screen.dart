import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybus_web/screens/dashboard/components/header.dart';
import 'package:easybus_web/screens/driver_manage/driver_signup.dart';
import 'package:easybus_web/screens/vehicle-manage/vehicle_registration.dart';
import 'package:flutter/material.dart';

import '../driver_manage/edit_del_button.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  List<DataRow> _buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = data;

    return DataRow(cells: [
      DataCell(Text(record.get('name'))),
      DataCell(Text(record.get('model'))),
      DataCell(Text(record.get('regNo'))),
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
        Header("Registered Vehicles"),
        SizedBox(height: defaultPadding),
        FloatingActionButton.extended(
          onPressed: () {
            showDialog(context: context, builder: (context) => VehicleReg());
          },
          label: Row(
            children: [
              Icon(Icons.add),
              Text("Add Vehicle"),
            ],
          ),
        ),
        Container(
          height: size.height * 0.8,
          width: size.width * 0.9,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('vehicles').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return DataTable(columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Model')),
                DataColumn(label: Text('Reg NO')),
                //DataColumn(label: Text('Actions')),
              ], rows: _buildList(context, snapshot.data!.docs));
            },
          ),
        ),
      ],
    );
  }
}
