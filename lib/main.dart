import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/Stair.dart';
import 'package:flutter_application_1/providers/flight_provider.dart';
import 'package:flutter_application_1/providers/project_provider.dart';
import 'package:flutter_application_1/screens/home.dart';
//import 'package:flutter_application_1/screens/flight_editor.dart';
import 'package:flutter_application_1/screens/local_stairs.dart';

import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/rampa_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAuNmucTGZyxT3WZ5kHXA4nZLe1RfWXGsw",
          databaseURL: "https://flight-data-colector-default-rtdb.firebaseio.com",
          projectId: "flight-data-colector",
          storageBucket: "flight-data-colector.appspot.com",
          messagingSenderId: "188566819091",
          appId: "1:188566819091:web:da9de35ebf09dbafba4ae6",
          measurementId: "G-RCLSN1Y9G0"));
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: ((context) => UserInput())), 
      ChangeNotifierProvider(create: ((context) => Stair())),
    ChangeNotifierProvider(create: (context) => FlightProvider()),
    ChangeNotifierProvider(create: (context) => ProjectProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //lastInputsValues.update('topCrotch', ((value) => true));
    return MaterialApp(
      theme: ThemeData(
          // brightness: Brightness.dark,
          //primaryColor: Colors.blueGrey,
          splashColor: Colors.blueGrey.shade600,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey,
          )),
      home: Home(),
    );
  }
}
//FirebaseFirestore.instance.collection('fligtsdata').add({'riser': 635});