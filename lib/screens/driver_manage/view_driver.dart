// import 'dart:convert';

// import 'package:admin/screens/dashboard/components/header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class ViewDriverList extends StatefulWidget {
//   const ViewDriverList({Key? key}) : super(key: key);

//   @override
//   _ViewDriverListState createState() => _ViewDriverListState();
// }

// class _ViewDriverListState extends State<ViewDriverList> {
//   @override
//   List _items = [];
//   Future<void> readJson() async {
//     final String response =
//         await rootBundle.loadString('lib/models/driversList.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = data["drivers"];
//     });
//   }

//   Widget build(BuildContext context) {
//     return
//     Scaffold(
//       body: SingleChildScrollView(
//         child: Column( children: [
//           //Header("View Drivers"),
//           SizedBox(height: 16),
//           Expanded(
//             flex: 3,
//             child: DataTable(
//               sortAscending: true,
//               columns: const <DataColumn>[
//                 DataColumn(
//                   label: Text(
//                     'Name',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Route',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Vehicle number',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Contact Number',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//               ],
//               rows:
//                   // _items // Loops through dataColumnText, each iteration assigning the value to element
//                   //     .map(
//                   //       ((element) =>
//                          const <DataRow>[
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Mohit')),
//             DataCell(Text('23')),
//             DataCell(Text('Professional')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Aditya')),
//             DataCell(Text('24')),
//             DataCell(Text('Associate Professor')),
//           ],
//         ),
//                          ]),
//                       )
//                       //.toList(),
//          ] ),
//           )
//         );
      
    
//   }
// }
