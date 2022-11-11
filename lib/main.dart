import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/AllFlight.dart';
import 'package:flutter_application_1/screens/escalera.dart';
import 'package:flutter_application_1/screens/home.dart';

import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/rampa_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: ((context) => UserInput())), ChangeNotifierProvider(create: ((context) => AllFlight()))],
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
      home: const Home(),
    );
  }
}
