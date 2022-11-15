import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/proyecto.dart';
import 'package:flutter_application_1/providers/project_provider.dart';
import 'package:flutter_application_1/screens/UploadedStairs.dart';
import 'package:flutter_application_1/screens/cloud_projects.dart';
//import 'package:flutter_application_1/screens/flight_editor.dart';
import 'package:flutter_application_1/screens/local_projects.dart';
import 'package:flutter_application_1/screens/local_stairs.dart';
import 'package:flutter_application_1/screens/new_project.dart';
import 'package:flutter_application_1/widget/project_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController projectNameController = TextEditingController();
  FocusNode miFocus = FocusNode();
  bool _error = false;

  @override
  void dispose() {
    projectNameController.dispose();
    miFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentProject = context.read<ProjectProvider>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: 200.0,
              height: 200.0,
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CloudProjects()),
                    );
                  },
                  icon: const Icon(Icons.cloud_download),
                  label: const Text('Cloud Projects'))),
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: 200.0,
            height: 200.0,
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocalProjects()));
              },
              icon: const Icon(Icons.memory),
              label: const Text('Projects'),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: 200.0,
              height: 200.0,
              child: TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Project's name"),
                          content: Focus(
                            child: TextFormField(
                              controller: projectNameController,
                              focusNode: miFocus,
                              autofocus: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  _error = true;
                                  return '';
                                }
                                _error = false;
                                return null;
                              },
                            ),
                            onFocusChange: (value) {
                              if (!value) {
                                if (_error) {
                                  miFocus.requestFocus();
                                }
                              } else {
                                projectNameController.selection = TextSelection(
                                    baseOffset: 0,
                                    extentOffset: projectNameController
                                        .value.text.length);
                              }
                            },
                          ),
                          actions: [
                            TextButton.icon(
                              onPressed: () {
                                if (projectNameController.text.length > 1) {
                                  currentProject.name = projectNameController.text;
                                  projectNameController.text = '';

                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NewProject(),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.check),
                              label: const Text("OK"),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.cancel),
                              label: const Text("Cancel"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('New Project'))),
        ],
      ),
    );
  }
}
