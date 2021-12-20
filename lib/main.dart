import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'controllers/MenuController.dart';
import 'locator.dart';
import 'screens/main/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          // name: "easybusWeb",
          options: const FirebaseOptions(
              apiKey: "AIzaSyCdnsfyoRHd6pesaaRARMNwh2WYoPgnnmE",
              authDomain: "easybus-7dfdc.firebaseapp.com",
              databaseURL: "https://easybus-7dfdc-default-rtdb.firebaseio.com",
              projectId: "easybus-7dfdc",
              storageBucket: "easybus-7dfdc.appspot.com",
              messagingSenderId: "315725034191",
              appId: "1:315725034191:web:dc01e48a20c32b877e3dba",
              measurementId: "G-TYPPW8646P"))
      .then((value) {
    setupLocator();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Bus Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
