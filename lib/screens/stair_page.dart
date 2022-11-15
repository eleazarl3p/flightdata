import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/project_provider.dart';
import 'package:provider/provider.dart';

import '../models/escalera.dart';

class StairPage extends StatefulWidget {
  int index;
  StairPage({Key? key, required this.index}) : super(key: key);

  @override
  State<StairPage> createState() => _StairPageState();
}

class _StairPageState extends State<StairPage> {


  @override
  Widget build(BuildContext context) {
    final currentProject = context.read<ProjectProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('${currentProject.stairsList[widget.index].identifier}')
        ),
      ),

      body: Container(
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: Text(''),
            ),
            Expanded(
              flex: 1,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton.icon(
                        onPressed: () {


                          Escalera newEscalera = Escalera(identifier: '');
                          setState(() {


                            currentProject.stairsList.add(newEscalera);
                          });

                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add Flight'),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                          label: const Text('Submit')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
