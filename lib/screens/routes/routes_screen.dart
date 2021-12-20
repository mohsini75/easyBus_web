import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  Widget _headerBuilder(BuildContext context, bool isExpanded) {
    return new Text("headerBuilder");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: ElevatedButton(
            child: Text("Add"),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Container(
            height: size.height * 0.8,
            width: size.width * 0.85,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('routes')
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ExpansionPanelList(
                      children: snapshot.data.documents
                          .map((account) => new ExpansionPanel(
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("Some title"),
                                );
                              },
                              body: ListTile(
                                title: Text("Some text"),
                              )))
                          .toList(),
                    );
                  }),
            ),
          ),
        )
      ],
    );
  }
}
