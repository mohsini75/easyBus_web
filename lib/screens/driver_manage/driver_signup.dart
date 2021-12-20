import 'package:easybus_web/screens/driver_manage/driver_regestration_form.dart';
import 'package:flutter/material.dart';

class DriverSignUp extends StatelessWidget {
  DriverSignUp({Key? key}) : super(key: key);
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  TextEditingController ConfirmPasswordControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: 300,
            height: 60,
            child: TextFormField(
              controller: emailControl,
              obscureText: false,
              textAlign: TextAlign.center,
              onSaved: (value) {
                emailControl.text = value!;
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
                hintText: 'Email',
                icon: Icon(Icons.email),
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
              controller: passwordControl,
              obscureText: true,
              textAlign: TextAlign.center,
              onSaved: (value) {
                passwordControl.text = value!;
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
                // prefixIcon: Icon(Icons.vpn_key),
                hintText: 'Password',
                icon: Icon(Icons.password),
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
              controller: ConfirmPasswordControl,
              obscureText: true,
              textAlign: TextAlign.center,
              onSaved: (value) {
                passwordControl.text = value!;
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
                icon: Icon(Icons.password),
                hintText: 'Confirm Password',
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
          child: TextButton(
            onPressed: () {
              //Fluttertoast.showToast(msg: 'Driver Authenticated!');
              showDialog(
                  context: context, builder: (context) => DriverRegForm());
            },
            child: Text(
              "Create SignUp",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
    ;
  }
}
