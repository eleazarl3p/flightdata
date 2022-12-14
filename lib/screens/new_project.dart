import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/poste_de_tramo.dart';
import 'package:flutter_application_1/providers/flight_provider.dart';
import 'package:flutter_application_1/providers/project_provider.dart';
import 'package:flutter_application_1/screens/flightEditor.dart';
import 'package:flutter_application_1/screens/stair_page.dart';
import 'package:flutter_application_1/widget/project_widget.dart';
import 'package:flutter_application_1/widget/stair_widget.dart';
import 'package:provider/provider.dart';

import '../models/escalera.dart';
import '../models/poste.dart';
import '../models/proyecto.dart';
import '../models/tramo.dart';
import '../providers/Stair.dart';

class NewProject extends StatefulWidget {
  NewProject({Key? key}) : super(key: key);

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  // Tramo templateFlight = Tramo(
  //     flightName: 'flightName',
  //     riser: 6.6875,
  //     bevel: 7.3125,
  //     topCrotchDistance: 0.0,
  //     bottomCrotchDistance: 0.0,
  //     topCrotch: true,
  //     bottomCrotch: true,
  //     bottomCrotchPost: false,
  //     numberOfStep: 12,
  //     bottomPostList: <Poste>[],
  //     topPostList: <Poste>[],
  //     rampPostList: <PosteDeTramo>[]);

  @override
  Widget build(BuildContext context) {
    final currentProject = context.watch<ProjectProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(" Project : ${currentProject.name}"),
        ),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: StairWidget(),
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
                        label: const Text('Add Stair'),
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
