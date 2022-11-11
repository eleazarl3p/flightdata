// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget portraitScaffold;
  final Widget landscapeScaffold;

  const ResponsiveLayout({
    Key? key,
    required this.portraitScaffold,
    required this.landscapeScaffold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? portraitScaffold
            : landscapeScaffold);
  }
}
