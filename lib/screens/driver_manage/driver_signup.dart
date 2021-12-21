import 'package:easybus_web/screens/driver_manage/driver_regestration_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriverSignUp extends StatefulWidget {
  DriverSignUp({Key? key}) : super(key: key);

  @override
  State<DriverSignUp> createState() => _DriverSignUpState();
}

class _DriverSignUpState extends State<DriverSignUp> {
  TextEditingController emailControl = new TextEditingController();

  TextEditingController passwordControl = new TextEditingController();

  TextEditingController ConfirmPasswordControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    void showDailog(String meassage) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error Message'),
          content: Text(meassage),
          actions: [
            TextButton(
              child: Text("okay"),
              onPressed: () => Navigator.of(ctx).pop(),
            )
          ],
        ),
      );
    }

    var _isLoading = false;

    Future<void> _submit() async {
      try {
        if (!_formKey.currentState!.validate()) {
          // Invalid!
          return;
        }
        _formKey.currentState!.save();
        setState(() {
          _isLoading = true;
        });
      } on Exception catch (error) {
        showDailog(error.toString());
      } catch (error) {
        showDailog(error.toString());
      }
    }

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
                if (value!.isEmpty) {
                  return 'enter email';
                } else if (value.contains('-')) {
                  return 'invalid email format';
                } else if (!value.contains('@')) {
                  return 'invalid email format';
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
                if (value!.isEmpty || value.length < 5) {
                  return 'Password is too short!';
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
                if (value!.isEmpty || value.length < 5) {
                  return 'Password is too short!';
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
            onPressed: () async {
              final rUser = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailControl.text, password: passwordControl.text);
              Navigator.of(context, rootNavigator: true).pop('dialog');
              Fluttertoast.showToast(msg: 'Driver Authenticated!');
              showDialog(
                context: context,
                builder: (context) => DriverRegForm(rUser.user),
              );
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
  }
}
