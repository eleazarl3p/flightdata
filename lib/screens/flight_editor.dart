import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/rampa_provider.dart';

import '../responsive/landscape_scaffold.dart';
import '../responsive/portrait_scaffold.dart';
import '../responsive/responsive_layout.dart';

class FlightEditor extends StatefulWidget {
  FlightEditor({super.key, required this.flightName});

  String flightName;
  @override
  State<FlightEditor> createState() => _FlightEditorState();
}

class _FlightEditorState extends State<FlightEditor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ResponsiveLayout(
            portraitScaffold: PortraitScaffold(
              flightName: widget.flightName,
            ),
            landscapeScaffold: LandscapeScaffold(
              flightName: widget.flightName,
            )));
  }
}
