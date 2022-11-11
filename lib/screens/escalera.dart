import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/rampa_provider.dart';

import '../responsive/landscape_scaffold.dart';
import '../responsive/portrait_scaffold.dart';
import '../responsive/responsive_layout.dart';

class Escalera extends StatefulWidget {
  Escalera({super.key, required this.flightNumber});

  int flightNumber;
  @override
  State<Escalera> createState() => _EscaleraState();
}

class _EscaleraState extends State<Escalera> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ResponsiveLayout(
            portraitScaffold: PortraitScaffold(
              fligthNumber: widget.flightNumber,
            ),
            landscapeScaffold: LandscapeScaffold(
              flightNumber: widget.flightNumber,
            )));
  }
}
