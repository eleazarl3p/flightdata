import "package:flutter/material.dart";
import 'package:flutter_application_1/components/flight_data_input.dart';
import 'package:flutter_application_1/components/stair_painter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/flight_provider.dart';

// import provider
// import 'package:provider/provider.dart';
// import "package:flutter_application_1/providers/rampa_provider.dart";

class LandscapeScaffold extends StatelessWidget {
  LandscapeScaffold({super.key});

  //String flightName;

  @override
  Widget build(BuildContext context) {
    final flightProv = context.watch<FlightProvider>();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Flight ${flightProv.flightName}")), backgroundColor: Colors.blueGrey.shade400), //appbar,
      body: Row(children: [
        const Expanded(
          //flex: 2,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: StairPainter(),
          ),
        ),
        SizedBox(
          width: 400.0,
          child: FlighDataInput(
            flightName: flightProv.flightName,
          ),
        )
        //HomeDataInput()
        // Expanded(
        //   flex: 1,
        //   child: HomeDataInput(),
        // )
      ]),
    );
  }
}


// class LandscapeScaffold extends StatelessWidget {
//   late String value1;
//   LandscapeScaffold({super.key, required this.value1});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appbar,
//       drawer: appdrawer,
//       body: Row(children: [
//         Expanded(
//           flex: 2,
//           child: Container(
//             color: Colors.red,
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: HomeDataInput(
//             val1: value1,
//           ),
//         )
//       ]),
//     );
//   }
// }
