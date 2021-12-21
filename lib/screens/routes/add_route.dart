import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddRoute extends StatefulWidget {
  AddRoute({Key? key}) : super(key: key);

  @override
  _AddRouteState createState() => _AddRouteState();
}

class _AddRouteState extends State<AddRoute> {
  List list = ["Route1", "Route2"];
  final TextEditingController _controller = TextEditingController();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.black87)),
              child: TextField(
                controller: _controller,
                onSubmitted: (enteredValue) {
                  print(enteredValue);

                  FirebaseFirestore.instance
                      .collection('users')
                      .doc("desiredID")
                      .update({"wayPoint": enteredValue}).then((value) {
                    _controller.clear();
                  });
                },
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search Location',
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Container(
            height: size.height * 0.75,
            width: size.width * 0.86,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(list[i].toString()),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 5),
        Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Save",
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
