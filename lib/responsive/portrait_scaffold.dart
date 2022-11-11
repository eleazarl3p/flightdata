// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/stair_painter.dart';

import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/components/home_data_input.dart';

import '../model/Post.dart';

class PortraitScaffold extends StatelessWidget {
  //late Map userInputs = ;
  PortraitScaffold({Key? key, required this.fligthNumber}) : super(key: key);

  int fligthNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StairPainter(),
          ),
        ),
        Expanded(
          flex: 1,
          child: HomeDataInput(
            flightNumber: fligthNumber,
          ),
        )
      ]),
    );
  }
}
