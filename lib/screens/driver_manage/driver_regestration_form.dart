import 'package:flutter/material.dart';

class DriverRegForm extends StatefulWidget {
  const DriverRegForm({Key? key}) : super(key: key);

  @override
  _DriverRegFormState createState() => _DriverRegFormState();
}

class _DriverRegFormState extends State<DriverRegForm> {
  TextEditingController emailControl = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController cnic = new TextEditingController();
  TextEditingController contact = new TextEditingController();
  String newa = '';
  List<String> panic = <String>[
    'select Route',
    'Route1 ',
    'Route2 ',
    'Route3 ',
    'Route4 ',
  ];

  String newPanicValue = 'select Route';
  /////////////////////////////////////////////////////////////////////////
  List<String> panic1 = <String>[
    'Select vehicle',
    'vehicle 1',
    'vehicle 2',
    'vehicle 3',
    'vehicle 4',
  ];

  String newPanicValue1 = 'Select vehicle';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 300,
            height: 60,
            child: TextFormField(
              controller: name,
              textAlign: TextAlign.center,
              onSaved: (value) {
                name.text = value!;
              },
              validator: (value) {
                RegExp regEx = new RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("Name Is required for login");
                }
                if (!regEx.hasMatch(value)) {
                  return ("Please Enter Valid name");
                }
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.vpn_key),
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Color(0xffaa9976),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: 300,
            height: 60,
            child: TextFormField(
              controller: cnic,
              textAlign: TextAlign.center,
              onSaved: (value) {
                cnic.text = value!;
              },
              validator: (value) {
                RegExp regEx = new RegExp(r'^.{2,}$');
                if (value!.isEmpty) {
                  return ("this field is required for login");
                }
                if (!regEx.hasMatch(value)) {
                  return ("Please Enter Valid Role");
                }
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.vpn_key),
                hintText: 'Cnic',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Color(0xffaa9976),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: 300,
            height: 60,
            child: TextFormField(
              controller: contact,
              textAlign: TextAlign.center,
              onSaved: (value) {
                contact.text = value!;
              },
              validator: (value) {
                RegExp regEx = new RegExp(r'^.{2,}$');
                if (value!.isEmpty) {
                  return ("this Field Is required for login");
                }
                if (!regEx.hasMatch(value)) {
                  return ("Please Enter Valid ID");
                }
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Contact',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Color(0xffaa9976),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: 300,
            height: 40,
            color: Colors.white,
            child: DropdownButton<String>(
              onChanged: (String? newValue) {
                setState(() {
                  newPanicValue = newValue!;
                  newa = newValue;
                });
              },
              onTap: () {},
              isExpanded: true,
              value: newPanicValue,
              items: panic.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: 300,
            height: 40,
            color: Colors.white,
            child: DropdownButton<String>(
              onChanged: (String? newValue) {
                setState(() {
                  newPanicValue1 = newValue!;
                  newa = newValue;
                });
              },
              onTap: () {},
              isExpanded: true,
              value: newPanicValue1,
              items: panic1.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: TextButton(
              onPressed: () {
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => ));
                // Fluttertoast.showToast(msg: 'Create');
                // // signUp(emailControl.text, passwordControl.text);
              },
              child: Text("Create Driver")),
        )
      ],
    );
  }
}
