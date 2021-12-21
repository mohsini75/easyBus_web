import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VehicleReg extends StatefulWidget {
  VehicleReg({Key? key}) : super(key: key);

  @override
  _VehicleRegState createState() => _VehicleRegState();
}

class _VehicleRegState extends State<VehicleReg> {
  TextEditingController name = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController reg = new TextEditingController();

  
  double defaultPadding = 16;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        SizedBox(height: 20),
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
                  return ("Name is required for login");
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
              controller: model,
              textAlign: TextAlign.center,
              onSaved: (value) {
                model.text = value!;
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
                hintText: 'Model',
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
              controller: reg,
              textAlign: TextAlign.center,
              onSaved: (value) {
                reg.text = value!;
              },
              validator: (value) {
                RegExp regEx = new RegExp(r'^.{2,}$');
                if (value!.isEmpty) {
                  return ("this Field Is required for registration");
                }
                if (!regEx.hasMatch(value)) {
                  return ("Please Enter Valid Reg");
                }
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Registration',
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
        Center(
          child: TextButton(
            onPressed: () {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => ));
              // Fluttertoast.showToast(msg: 'Create');
              //print(widget.rUser!.uid,name,cnic,contact,),
              FirebaseFirestore.instance.collection("vehicles").add({
                'name': name.text,
                'model': model.text,
                'regNo': reg.text,
              });
              Fluttertoast.showToast(msg: 'Vehicle Added!');
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
            child: Text("Register Vehicle", style: TextStyle(fontSize: 20)),
          ),
          // // signUp(emailControl.text, passwordControl.text);
        )
      ],
    );
  }
}
