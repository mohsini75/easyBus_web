import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybus_web/screens/dashboard/components/header.dart';
import 'package:easybus_web/screens/routes/add_route.dart';
import 'package:flutter/material.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

var a;
final _db = FirebaseFirestore.instance
    .collection('routes')
    .snapshots()
    .forEach((element) {
  a = element.docs;
});

List<Item> dataGenerate() {
  List<Item> _data = [];
  FirebaseFirestore.instance.collection("routes").get().then(
    (QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      var hval;
      var expVal;
      var extractedMap = querySnapshot.docs.forEach(
        (element) {
          hval = element.data()['routeNo'];
          expVal = element.data()['routeStops'];
          print(hval + " + " + expVal);
          _data.add(Item(
              expandedValue: expVal, headerValue: hval, isExpanded: false));
        },
      );
    },
  );
  return _data;
}

class _RoutesScreenState extends State<RoutesScreen> {
  final List<Item> _data = dataGenerate();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text("header " + item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            // subtitle:
            //     const Text('To delete this panel, tap the trash can icon'),
            // trailing: const Icon(Icons.delete),
            // onTap: () {
            //   setState(() {
            //     _data.removeWhere((Item currentItem) => item == currentItem);
            //   });
            // },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );

    // Widget _headerBuilder(BuildContext context, bool isExpanded) {
    //   return new Text("headerBuilder");
    // }

    // double defaultPadding = 16;
    // @override
    // Widget build(BuildContext context) {
    //   var size = MediaQuery.of(context).size;
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Header("Assigned Drivers"),
    //       SizedBox(height: defaultPadding),
    //       FloatingActionButton.extended(
    //         onPressed: () {
    //           showDialog(context: context, builder: (context) => AddRoute());
    //         },
    //         label: Row(
    //           children: [
    //             Icon(Icons.add),
    //             Text("Create Route"),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         height: size.height * 0.8,
    //         width: size.width * 0.9,
    //         child: StreamBuilder(
    //             stream:
    //                 FirebaseFirestore.instance.collection('routes').snapshots(),
    //             builder: (BuildContext context, AsyncSnapshot snapshot) {
    //               return ExpansionPanelList(
    //                 children: snapshot.data.docs
    //                     .map<ExpansionPanel>((account) => new ExpansionPanel(
    //                         headerBuilder:
    //                             (BuildContext context, bool isExpanded) {
    //                           return ListTile(
    //                             title: Text(account['routeNo']),
    //                           );
    //                         },
    //                         body: ListTile(
    //                           title: Text("Some text"),
    //                         )))
    //                     .toList(),
    //               );
    //             }),
    //       ),
    //     ],
    //   );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(left: 40),
    //       child: ElevatedButton(
    //         child: Text("Add"),
    //         onPressed: () {},
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.only(left: 20, top: 10),
    //       child: Container(
    //         height: size.height * 0.8,
    //         width: size.width * 0.85,
    //         color: Colors.grey[200],
    //         child: SingleChildScrollView(
    //           child: StreamBuilder(
    //               stream: FirebaseFirestore.instance
    //                   .collection('routes')
    //                   .snapshots(),
    //               builder: (BuildContext context, AsyncSnapshot snapshot) {
    //                 return ExpansionPanelList(
    //                   children: snapshot.data.documents
    //                       .map((account) => new ExpansionPanel(
    //                           headerBuilder:
    //                               (BuildContext context, bool isExpanded) {
    //                             return ListTile(
    //                               title: Text("Some title"),
    //                             );
    //                           },
    //                           body: ListTile(
    //                             title: Text("Some text"),
    //                           )))
    //                       .toList(),
    //                 );
    //               }),
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
