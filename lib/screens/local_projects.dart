import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalProjects extends StatelessWidget {
  const LocalProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Projects"),
      ),
      body: Center(child: Text("Aqui va local Projects")),
    );
  }
}
