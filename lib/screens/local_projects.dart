import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalProjects extends StatelessWidget {
  const LocalProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0
          )
        ),
      ),
    );
  }
}
