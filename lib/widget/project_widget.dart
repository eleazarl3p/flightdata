import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/escalera.dart';

import '../models/tramo.dart';




class ProjectWidget extends StatelessWidget {
  List<Escalera> stairs;
  ProjectWidget({Key? key, required this.stairs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(backgroundBlendMode: BlendMode.colorBurn, color: Colors.white12),
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
                        decoration: BoxDecoration(border: Border.all(width: 2.0, color: Colors.black), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(10.0),
                                itemCount: stairs.length,
                                itemBuilder: ((context, index) {

                                  return Card(
                                    color: Colors.brown.shade100,
                                    child: ListTile(
                                      leading: Text(stairs[index].identifier),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextButton.icon(
                                              onPressed: () {

                                              },
                                              icon: const Icon(Icons.copy),
                                              label: const Text('Copy')),
                                          TextButton.icon(
                                              onPressed: () {

                                              },



                                              icon: const Icon(Icons.edit),
                                              label: const Text('Edit')),
                                          TextButton.icon(
                                              onPressed: () {

                                              },
                                              icon: const Icon(Icons.delete),
                                              label: const Text('Delete')),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 20.0,
                            // ),
                            // ElevatedButton(
                            //   child: const Text(' Submit '),
                            //   onPressed: () {
                            //     //FirebaseFirestore.instance.collection('fligtsdata').add({'riser': 88935});
                            //
                            //   },
                            // ),
                            // const SizedBox(
                            //   height: 20.0,
                            // ),
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
