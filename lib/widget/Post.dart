import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/rampa_provider.dart';

class FlatPostTable extends StatefulWidget {
  FlatPostTable({
    super.key,
    required this.postList,
    required this.flatposition,
    required this.resetView,
    required this.alphabet,
    this.enableLosBtn = true,
  });

  late List<Post> postList;
  final String flatposition; // bottom or up
  final VoidCallback resetView;
  final List alphabet;
  bool enableLosBtn;
  //late FocusNode upFocus;

  @override
  State<FlatPostTable> createState() => _FlatPostTableState();
}

class _FlatPostTableState extends State<FlatPostTable> {
  late TextEditingController controller = TextEditingController();
  late List<Post> itemList;
  late List<Post> lowerFlatPostList;
  late double crotchDistance;
  late bool crotch;
  late String side;
  late String initialLabel;
  bool distError = false;
  late bool _enableBtn;
  double postDistance = 0;

  //late bool distError;
  //late FocusNode actualFocus;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //actualFocus.dispose();
    super.dispose();
  }

  bool showRow = true;
  @override
  Widget build(BuildContext context) {
    final userInputsProvider = context.watch<UserInput>();
    itemList = userInputsProvider.textFormFields[widget.flatposition];
    //actualFocus = userInputsProvider.textFormFields['currentFocus'];
    //postDistance = 0;
    _enableBtn = userInputsProvider.textFormFields['enableBtn']; //widget.enableLosBtn;

    //userInputsProvider.textFormFields['enableBtn'];
    //print('post enable ${widget.enableLosBtn}');

    if (widget.flatposition == 'lowerFlatPost') {
      side = 'bottom';
      initialLabel = 'B';
      crotchDistance = double.parse(userInputsProvider.textFormFields['bottomCrotchLength']);
      //distError = userInputsProvider.textFormFields['btmError'];
      if (userInputsProvider.textFormFields['bottomCrotch']) {
        crotch = true;
      } else {
        crotch = false;
      }
    } else {
      crotchDistance = double.parse(userInputsProvider.textFormFields['topCrotchLength']);
      side = 'up';
      initialLabel = 'U';
      //distError = userInputsProvider.textFormFields['upFlatError'];

      if (userInputsProvider.textFormFields['topCrotch']) {
        crotch = true;
      } else {
        crotch = false;
      }
    }

    List<DataColumn> _createColumns() {
      return [
        const DataColumn(label: Text("Distance\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}")),
        const DataColumn(label: Text('Embed\u{00A0}Type')),
        const DataColumn(label: Text(''))
      ];
    }

    Widget buildPTable() {
      return DataTable(
        columns: _createColumns(),
        rows: showRow ? _createRows(userInputsProvider) : [],
        columnSpacing: 40,
      );
    }

    //widget.currenContext = context;

    return Card(child: SizedBox(width: 350, child: buildPTable()));
  }

  List<DataRow> _createRows(UserInput userInputsProvider) {
    Color _color = Colors.white;
    String _label = 'Unfocused';
    double sumDistance = 0.0;
    return List<DataRow>.generate(
        itemList.length,
        (index) => DataRow(cells: [
              DataCell(
                SizedBox(
                  width: 100.0,
                  child: Focus(
                    child: TextFormField(
                      focusNode: itemList[index].pFocusNode,
                      controller: itemList[index].pController,
                      decoration: InputDecoration(
                          label: Text("$initialLabel${index + 1}"),
                          border: const OutlineInputBorder(),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: ((value) {
                        if (value == null || double.tryParse(value) == null || value.isEmpty) {
                          itemList[index].error = true;
                          return '';
                        }

                        if (crotch) {
                          List sublista = itemList.sublist(0, index + 1);
                          sumDistance = sublista.fold(0, (sum, element) => sum.toDouble() + double.parse(element.pController.text));

                          double.parse(value);
                          if (sumDistance >= crotchDistance && double.parse(value) != 0) {
                            itemList[index].error = true;
                            return "";
                          }
                        }

                        itemList[index].error = false;
                        return null;
                      }),
                      onTap: (() {
                        itemList[index].pController.selection = TextSelection(baseOffset: 0, extentOffset: itemList[index].pController.value.text.length);
                      }),
                      onEditingComplete: () {},
                    ),
                    onFocusChange: (value) {
                      // if (_enable) {
                      if (!value) {
                        if (!itemList[index].error) {
                          itemList[index].distance = double.parse(itemList[index].pController.text);
                          userInputsProvider.updateFields(widget.flatposition, itemList);
                        } else {
                          itemList[index].pFocusNode.requestFocus();
                        }
                      } else {
                        //itemList[index].pFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
              ),
              DataCell(DropdownButton(
                isExpanded: false,
                items: const [
                  DropdownMenuItem(
                    value: "none",
                    child: Text("None"),
                  ),
                  DropdownMenuItem(
                    value: "plate",
                    child: Text("Plate"),
                  ),
                  DropdownMenuItem(
                    value: "sleeve",
                    child: Text("Sleeve"),
                  )
                ],
                value: itemList[index].embeddedType,
                onChanged: !_enableBtn
                    ? null
                    : (String? value) {
                        if (value is String) {
                          setState(() {
                            itemList[index].embeddedType = value;
                            userInputsProvider.updateFields(widget.flatposition, itemList);
                          });
                          //widget.resetView();
                        }
                      },
              )),
              DataCell(TextButton(
                  style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: !_enableBtn //&& !itemList[index].pFocusNode.hasFocus
                      ? null
                      : () {
                          //itemList[index].pController.text = '2';
                          itemList.removeAt(index);

                          userInputsProvider.updateFields(widget.flatposition, itemList);
                          //widget.resetView();
                        },
                  child: const Icon(Icons.delete)))
            ]));
  }
}

class Post {
  late double distance;
  late String initialValue;
  late String embeddedType;
  bool error = false;
  TextEditingController pController = TextEditingController(); // distance from post to previous post or starting point
  FocusNode pFocusNode = FocusNode();
  FocusNode buttonFocuse = FocusNode();

  Post({required this.distance, required this.embeddedType}) {
    pController.text = distance.toString();
  }

  // @override
  // void initState() {
  //   pController.text = initialValue;
  // }
  @override
  void dispose() {
    pController.dispose();
    buttonFocuse.dispose();
    pFocusNode.dispose();
  }

  valid(String? value, bool crotch, List itemList, crotchDistance, String side) {
    if (value!.isEmpty || double.tryParse(value) == null) {
      error = true;
      return "";
    } else if (crotch) {
      double sumDistance = itemList.fold(0, (sum, element) => sum.toDouble() + double.parse(element.pController.text));

      if (crotchDistance - sumDistance <= 0) {
        error = true;

        return "";
        //dialogAlerta(title: "Unable to add Post", msj: "Please review bottom crotch distance,\nand try again.");
      } else {
        distance = double.parse(value);
        error = false;
        return null;
      }
    } else {
      distance = double.parse(value);
      error = false;
      return null;
    }
  }
}

// ***************************************** Ramp Post ********************************************

