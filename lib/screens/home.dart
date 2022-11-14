import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/UploadedStairs.dart';
import 'package:flutter_application_1/screens/flight_editor.dart';
import 'package:flutter_application_1/screens/local_stairs.dart';

class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController fligthNameController = TextEditingController();

  @override
  void dispose() {
    fligthNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15.0)),
              width: 200.0,
              height: 200.0,
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UploadedStairs(stairs: const [1, 2, 3, 4, 5])));
                  },
                  icon: const Icon(Icons.cloud_download),
                  label: const Text('Cloud Projects'))),
          Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15.0)),
              width: 200.0,
              height: 200.0,
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocalStair()));
                  },
                  icon: const Icon(Icons.memory),
                  label: const Text('Projects'))),
          Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15.0)),
              width: 200.0,
              height: 200.0,
              child: TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("New Project"),
                            content: Focus(
                              child: TextFormField(
                                controller: fligthNameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                autocorrect: true,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '';
                                  }

                                  return null;
                                },
                              ),
                              // onFocusChange: (value){
                              //   if(!value) {
                              //     if(){
                              //
                              //     }
                              //
                              // },
                            ),
                            actions: [
                              TextButton.icon(
                                  onPressed: () {
                                    if(fligthNameController.text.length >1){
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ))
                                    } 
                                  },
                                  icon: Icon(Icons.check),
                                  label: Text("OK")),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.cancel),
                                  label: Text("Cancel"))
                            ],
                          );
                        });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => FlightEditor(flightName: '0')));
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('New Stair'))),
        ],
      ),
    );
  }
}
