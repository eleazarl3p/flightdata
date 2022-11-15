// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/stair_painter.dart';

import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/components/flight_data_input.dart';
import 'package:flutter_application_1/providers/flight_provider.dart';
import 'package:provider/provider.dart';

import '../widget//Post.dart';

class PortraitScaffold extends StatelessWidget {
  //late Map userInputs = ;
  PortraitScaffold({Key? key}) : super(key: key);

  //String flightName;
  @override
  Widget build(BuildContext context) {
    final flightProv = context.watch<FlightProvider>();
    return Scaffold(
      appBar: appbar,
      body: Column(children: [
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: StairPainter(),
          ),
        ),
        Expanded(
          flex: 1,
          child: FlighDataInput(
            flightName: flightProv.flightName,
          ),
        )
      ]),
    );
  }
}
