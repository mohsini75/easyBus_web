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
  @override
  double defaultPadding = 16;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    floatingActionButtonLocation:
    FloatingActionButtonLocation.centerFloat;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
              Text("+ add driver"),
            ],
          ),
        ),
        Container(
          height: size.height * 0.8,
          // width: size.width*0.9,
          child: DataTable(
            sortAscending: true,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Route',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Vehicle number',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Contact Number',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '    Actions',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                selected: true,
                cells: <DataCell>[
                  DataCell(Text('Mohsin')),
                  DataCell(Text('2')),
                  DataCell(Text('abc123')),
                  DataCell(Text('03213454687')),
                  DataCell(new Edit_Del_Button(
                    id: "123",
                    onpress: (onpressedfunction) {},
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Mohsin')),
                  DataCell(Text('2')),
                  DataCell(Text('abc123')),
                  DataCell(Text('03213454687')),
                  DataCell(new Edit_Del_Button(
                    id: "123",
                    onpress: () {},
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Mohsin')),
                  DataCell(Text('2')),
                  DataCell(Text('abc123')),
                  DataCell(Text('03213454687')),
                  DataCell(new Edit_Del_Button(
                    id: "123",
                    onpress: () {},
                  )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
