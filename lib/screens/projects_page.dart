import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proyecto.dart';
import 'package:flutter_application_1/providers/temporary_projects_provider.dart';
import 'package:provider/provider.dart';

import '../Utils/dbConn.dart';
import '../providers/project_provider.dart';
import 'new_project.dart';
// class LocalProjects extends StatelessWidget {
//   const LocalProjects({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Local Projects"),
//       ),
//       body: const Center(child: Text("Aqui va local Projects")),
//     );
//   }
// }

class LocalProjects extends StatefulWidget {
  LocalProjects({Key? key}) : super(key: key);

  @override
  State<LocalProjects> createState() => _LocalProjectsState();
}

class _LocalProjectsState extends State<LocalProjects> {
  TextEditingController projectNameController = TextEditingController();

  FocusNode miFocus = FocusNode();

  bool _error = false;

  @override
  void dispose() {
    projectNameController.dispose();
    miFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List tempProjects =
        Provider.of<TemporaryProjectsProvider>(context).projects;
    final tempProvider = Provider.of<TemporaryProjectsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Locally Saved Projects'),
      ),
      body: Center(
        child: Container(
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
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: tempProjects.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.brown.shade100,
                                        child: ListTile(
                                          leading: Checkbox(
                                            activeColor: Colors.white,
                                            checkColor: Colors.blueGrey,
                                            value: tempProjects[index].selected,
                                            onChanged: (value) {
                                              setState(() {
                                                tempProjects[index].toggle();
                                              });
                                            },
                                          ),
                                          title: Text(
                                            tempProjects[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                                color: Colors.blueGrey),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextButton.icon(
                                                  onPressed: () {

                                                    Provider.of<ProjectProvider>(context).update(tempProjects[index]);
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                                                  },
                                                  icon: const Icon(
                                                      Icons.open_in_new),
                                                  label: const Text('Open')),
                                              TextButton.icon(
                                                  onPressed: () {

                                                    String name = tempProjects[index].name;

                                                    tempProvider.addProject(Proyecto(name: '$name copy'));
                                                    //Navigator.pop(context);
                                                  },
                                                  icon: const Icon(Icons.copy),
                                                  label: const Text('Copy')),
                                              TextButton.icon(
                                                  onPressed: () {
                                                    tempProvider.removeProject(
                                                        tempProjects[index]);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  label: const Text('Delete')),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
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
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              autocorrect: true,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
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
                                                projectNameController
                                                        .selection =
                                                    TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset:
                                                            projectNameController
                                                                .value
                                                                .text
                                                                .length);
                                              }
                                            },
                                          ),
                                          actions: [
                                            TextButton.icon(
                                              onPressed: () {
                                                if (projectNameController
                                                        .text.length >
                                                    1) {
                                                  tempProvider.addProject(Proyecto(
                                                      name:
                                                          projectNameController
                                                              .text));
                                                  projectNameController.text =
                                                      '';
                                                  Navigator.pop(context);
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
                                  icon: const Icon(Icons.new_label),
                                  label: const Text("New"),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      // final tempProjects =
                                      // Provider.of<TemporaryProjectsProvider>(context,
                                      //     listen: false);
                                      // final curentProject = Provider.of<ProjectProvider>(
                                      //     context,
                                      //     listen: false);
                                      // Proyecto newProject =
                                      // Proyecto(name: curentProject.name);
                                      // newProject.stairsList = [
                                      //   ...currentProject.stairsList
                                      // ];
                                      // tempProjects.addProject(newProject);
                                      // Navigator.pop(context);
                                      //   ProjectProvider proj = Provider.of<ProjectProvider>(
                                      //       context,
                                      //       listen: false);
                                      //
                                      //
                                      //   var jsonData = proj.toJson();
                                      //   DB.create('projects', proj.name, {'data': jsonData});
                                    },
                                    icon: const Icon(Icons.save),
                                    label: const Text('Save')),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      // final tempProjects =
                                      // Provider.of<TemporaryProjectsProvider>(context,
                                      //     listen: false);
                                      // final curentProject = Provider.of<ProjectProvider>(
                                      //     context,
                                      //     listen: false);
                                      // Proyecto newProject =
                                      // Proyecto(name: curentProject.name);
                                      // newProject.stairsList = [
                                      //   ...currentProject.stairsList
                                      // ];
                                      // tempProjects.addProject(newProject);
                                      // Navigator.pop(context);
                                      ProjectProvider proj =
                                          Provider.of<ProjectProvider>(context,
                                              listen: false);

                                      for (var element in tempProjects) {
                                        DB.create('projects', element.name,
                                            {'data': element.toJson()});
                                      }

                                      // var jsonData = proj.toJson();
                                      // DB.create('projects', proj.name, {'data': jsonData});
                                    },
                                    icon: const Icon(Icons.upload),
                                    label: const Text('Upload')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
