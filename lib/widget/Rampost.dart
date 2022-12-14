import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/rampa_provider.dart';

class RampPostTable extends StatefulWidget {
  RampPostTable({super.key, required this.postList, required this.resetView, required this.enableLosBtn});

  late List<RampPost> postList;
  final VoidCallback resetView;
  late bool enableLosBtn;

  @override
  State<RampPostTable> createState() => _RampPostTableState();
}

class _RampPostTableState extends State<RampPostTable> {
  late List<RampPost> itemList;
  late int numStep;
  late bool _enable;

  late FocusNode curFocus;

  bool noseDistanceError = false;
  bool balusterError = false;

  @override
  void initState() {
    super.initState();
    curFocus = FocusNode();
  }

  @override
  void dispose() {
    curFocus.dispose();
    super.dispose();
  }

  bool showRow = true;
  @override
  Widget build(BuildContext context) {
    final userInputsProvider = context.read<UserInput>();
    itemList = userInputsProvider.textFormFields['rampPost'];
    numStep = int.parse(userInputsProvider.textFormFields['stairsCount']);
    _enable = widget.enableLosBtn;

    //userInputsProvider.textFormFields['active'];

    List<String> minAlphabet = List.generate(26, (index) => String.fromCharCode(index + 65));
    //curFocus = userInputsProvider.textFormFields['currentFocus'];

    //itemList.sort(((a, b) => a.step.compareTo(b.step)));

    //         widgt,
    //         showEditIcon: cellEdition,
    //         onTap: () {
    //           switch (index) {
    //             case 0:
    //               editNosing(post);
    //               break;
    //             case 1:
    //               editThread(post);
    //               break;
    //             case 2:
    //               editStair(post);
    //               break;
    //             case 3:
    //               deletePost(post);
    //               break;
    //           }
    //         },
    //       );
    //     }));
    //   }).toList();
    // }

    Widget buildPTable() {
      final columns = [
        const Text("Nosing"),
        const Text("Thread"),
        const Text("Stair\u{00A0}\u{00A0}"),
        TextButton(
            onPressed: () {
              showRow = !showRow;
              setState(() {});
            },
            child: showRow
                ? const Icon(
              Icons.close_outlined,
            )
                : const Icon(Icons.remove_red_eye_outlined))
      ];
      return DataTable(
        columns: const [
          DataColumn(label: Text("Dist.\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}")),
          DataColumn(label: Text('Bal.\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}')),
          DataColumn(label: Text("Step\u{00A0}\u{00A0}\u{00A0}#\u{00A0}")),
          DataColumn(label: Text("Emb.\u{00A0}Type")),
          DataColumn(label: Text(''))
        ],
        rows: showRow
            ? List<DataRow>.generate(
            itemList.length,
                (index) => DataRow(cells: [
              DataCell(
                // nosing
                SizedBox(
                  width: 50.0,
                  //height: 40,
                  child: Focus(
                    child: TextFormField(
                      focusNode: itemList[index].noseFocus,
                      controller: itemList[index].noseController,
                      decoration: InputDecoration(
                          label: Text(minAlphabet.removeAt(0)),
                          border: const OutlineInputBorder(),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
                      autofocus: true,
                      autocorrect: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: ((value) {
                        if (value == null || value.isEmpty || double.tryParse(value) == null || double.parse(value) < 0) {
                          itemList[index].noseError = true;

                          return '';
                        }
                        itemList[index].noseError = false;
                        itemList[index].nosingDistance = double.parse(value);
                        return null;
                      }),
                      onTap: () => itemList[index].noseController.selection =
                          TextSelection(baseOffset: 0, extentOffset: itemList[index].noseController.value.text.length),
                    ),
                    onFocusChange: (value) {
                      if (!value) {
                        nodeDistanceValidator(userInputsProvider);
                      } else {
                        itemList[index].noseController.selection =
                            TextSelection(baseOffset: 0, extentOffset: itemList[index].noseController.value.text.length);
                      }
                    },
                  ),
                ),
              ),
              DataCell(
                // baluster
                SizedBox(
                  width: 50.0,
                  // height: 450,
                  child: Focus(
                    child: TextFormField(
                      controller: itemList[index].balusterController,
                      focusNode: itemList[index].balusterFocus,
                      decoration: const InputDecoration(
                        //helperText: ' ',
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
                      //autofocus: true,
                      autocorrect: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: ((value) {
                        if (value == null || value.isEmpty || double.tryParse(value) == null || value.isEmpty || double.parse(value) < 0) {
                          itemList[index].balusterError = true;
                          return '';
                        }
                        itemList[index].balusterError = false;
                        itemList[index].balusterDistance = double.parse(value);

                        return null;
                      }),
                      onTap: () => itemList[index].balusterController.selection =
                          TextSelection(baseOffset: 0, extentOffset: itemList[index].balusterController.value.text.length),
                      // onEditingComplete: () {
                      //   balusterDistanceValidator(userInputsProvider);
                      // },
                    ),
                    onFocusChange: (value) {
                      if (!value) {
                        balusterDistanceValidator(userInputsProvider);
                      } else {
                        itemList[index].balusterController.selection =
                            TextSelection(baseOffset: 0, extentOffset: itemList[index].balusterController.value.text.length);
                      }
                    },
                  ),
                ),
              ),
              DataCell(
                // step
                SizedBox(
                  width: 50.0,
                  // height: 450,
                  child: Focus(
                    child: TextFormField(
                      focusNode: itemList[index].stepFocus,
                      controller: itemList[index].stepController,
                      decoration: const InputDecoration(
                        //helperText: ' ',
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
                      //autofocus: true,
                      autocorrect: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: ((value) {
                        if (value == null || value.isEmpty || int.tryParse(value) == null || int.parse(value) >= numStep || int.parse(value) < 0) {
                          itemList[index].stepError = true;
                          return '';
                        }
                        itemList[index].stepError = false;
                        itemList[index].step = int.parse(value);

                        return null;
                      }),
                      onTap: () => itemList[index].stepController.selection =
                          TextSelection(baseOffset: 0, extentOffset: itemList[index].stepController.value.text.length),
                      // onEditingComplete: () {
                      //   stepValidator(userInputsProvider);
                      // },
                    ),
                    onFocusChange: (value) {
                      if (!value) {
                        stepValidator(userInputsProvider);
                      } else {
                        itemList[index].stepController.selection =
                            TextSelection(baseOffset: 0, extentOffset: itemList[index].stepController.value.text.length);
                      }
                    },
                  ),
                ),
              ),
              DataCell(DropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: 'none',
                    child: Text("None"),
                  ),
                  DropdownMenuItem(
                    value: 'plate',
                    child: Text("Plate"),
                  ),
                  DropdownMenuItem(
                    value: 'sleeve',
                    child: Text("Sleeve"),
                  ),
                ],
                value: itemList[index].embeddedType.toString(),
                onChanged: !_enable
                    ? null
                    : (String? value) {
                  if (value is String) {
                    setState(() {
                      itemList[index].embeddedType = value;
                      userInputsProvider.updateFields('rampPost', itemList);
                    });

                    //widget.resetView();
                  }
                },
              )),
              DataCell(SizedBox(
                width: 30.0,
                child: TextButton(
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    //   foregroundColor: Colors.black,
                    //   elevation: 0.0,
                    // ),
                    onPressed: _enable // userInputsProvider.textFormFields['active']
                        ? () {
                      setState(() {
                        itemList.removeAt(index);
                        userInputsProvider.updateFields('rampPost', itemList);
                      });
                      //widget.resetView();
                    }
                        : null,
                    child: const Icon(
                      Icons.delete,
                    )),
              )),
            ]))
            : [],
        columnSpacing: 12.0,
        horizontalMargin: 10.0,
      );
    }

    return Card(child: SizedBox(width: 450.0, child: buildPTable()));
  }

  void stepValidator(UserInput userInputsProvider) {
    bool _error = false;
    for (RampPost item in itemList) {
      if (item.stepError) {
        item.stepFocus.requestFocus();
        _error = true;
        break;
      }
    }

    if (!_error) {
      var seen = <String>{}; // remove duplicate step
      List<RampPost> filteredList = itemList.where((element) => seen.add(element.step.toString())).toList();

      setState(() {
        userInputsProvider.updateFields('rampPost', filteredList);
      });

      //widget.resetView();
    }
  }

  void nodeDistanceValidator(UserInput userInputsProvider) {
    bool _error = false;
    for (RampPost item in itemList) {
      if (item.noseError) {
        item.noseFocus.requestFocus();
        _error = true;
        break;
      }
    }
    if (!_error) {
      userInputsProvider.updateFields('rampPost', itemList);

      //widget.resetView();
    }
  }

  void balusterDistanceValidator(UserInput userInputsProvider) {
    bool _error = false;
    for (RampPost item in itemList) {
      if (item.balusterError) {
        item.balusterFocus.requestFocus();
        _error = true;
        break;
      }
    }
    if (!_error) {
      userInputsProvider.updateFields('rampPost', itemList);

      //widget.resetView();
    }
  }
}

class RampPost {
  late double nosingDistance;
  late double balusterDistance;
  late String embeddedType;
  late int step;
  bool stepError = false;
  bool noseError = false;
  bool balusterError = false;
  final FocusNode stepFocus = FocusNode();
  final FocusNode balusterFocus = FocusNode();
  final FocusNode noseFocus = FocusNode();

  TextEditingController noseController = TextEditingController();
  TextEditingController balusterController = TextEditingController();
  TextEditingController stepController = TextEditingController();

  //late int? stair;
  RampPost({required this.nosingDistance, required this.balusterDistance, required this.embeddedType, required this.step}) {
    noseController.text = nosingDistance.toString();
    balusterController.text = balusterController.toString();
    stepController.text = step.toString();

    // @override
    // void initState() {
    //   stepFocus = FocusNode();
    //   balusterFocus = FocusNode();
    //   noseFocus = FocusNode();
    // }
  }

  @override
  void dispose() {
    balusterController.dispose();
    stepFocus.dispose();
    balusterFocus.dispose();
    noseFocus.dispose();
  }

// valid(int maxStep) {
//   if (int.tryParse(stepController.text) == null) {
//     error = true;
//     return 'Error 100';
//   } else {
//     if (step <= maxStep) {
//       step = int.parse(stepController.text);
//       error = false;
//       return null;
//     } else {
//       error = true;
//       return "Error 200";
//     }
//   }
// }
}

// class Utils {
//   static List<T> modelBuilder<M, T>(List<M> models, T Function(int index, M model) builder) =>
//       models.asMap().map<int, T>((index, model) => MapEntry(index, builder(index, model))).values.toList();
// }
