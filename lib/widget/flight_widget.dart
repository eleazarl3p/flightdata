import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/project_provider.dart';
import '../screens/stair_page.dart';

class FlightWidget extends StatefulWidget {
  int pos;
  FlightWidget({Key? key, required this.pos}) : super(key: key);

  @override
  State<FlightWidget> createState() => _FlightWidgetState();
}

class _FlightWidgetState extends State<FlightWidget> {
  @override
  Widget build(BuildContext context) {
    final currentProject = context.watch<ProjectProvider>();

    return Container(
      decoration: const BoxDecoration(
          backgroundBlendMode: BlendMode.colorBurn, color: Colors.white12),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 3.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(10.0),
                                itemCount: currentProject.stairsList[widget.pos].flights.length,
                                itemBuilder: ((context, index) {
                                  return Card(
                                    color: Colors.brown.shade100,
                                    child: ListTile(
                                      leading: Container(
                                        width: 200,
                                        padding: EdgeInsets.only(bottom: 10.0),
                                        child: TextField(
                                          controller: TextEditingController(
                                              text: currentProject
                                                  .stairsList[index].identifier),
                                          onChanged: (value) {
                                            currentProject.stairsList[index]
                                                .identifier = value;
                                          },
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextButton.icon(
                                              onPressed: () {
                                                // Escalera esc = currentProject
                                                //     .stairsList[index];
                                                // currentProject.addStair(esc);
                                              },
                                              icon: const Icon(Icons.copy),
                                              label: const Text('Copy')),
                                          TextButton.icon(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StairPage(index: index,),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(Icons.edit),
                                              label: const Text('Edit')),
                                          TextButton.icon(
                                              onPressed: () {
                                                currentProject.removeStair(index);
                                              },
                                              icon: const Icon(Icons.delete),
                                              label: const Text('Delete')),
                                          // TextButton.icon(
                                          //     onPressed: () {},
                                          //     icon: const Icon(Icons.save),
                                          //     label: const Text('Save')),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ]),
    );
  }
}
