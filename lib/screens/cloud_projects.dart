import 'package:flutter/material.dart';

class CloudProjects extends StatelessWidget {
  const CloudProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Projects'),
      ),
      body: Center(child: Text("aqui va los projectos de la nuebe"),),
    );
  }
}
