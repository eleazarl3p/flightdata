// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:flutter_application_1/providers/rampa_provider.dart';

// // import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:flutter_application_1/model/Post.dart';

// class HomeDataInput extends StatefulWidget {
//   const HomeDataInput({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<HomeDataInput> createState() =>
//       // ignore: no_logic_in_create_state
//       _HomeDataInputState();
// }

// class _HomeDataInputState extends State<HomeDataInput> {
//   _HomeDataInputState();

//   late TextEditingController riserController = TextEditingController();
//   late TextEditingController bevelController = TextEditingController();

//   late TextEditingController topCrotchLengthController = TextEditingController();
//   late TextEditingController bottomCrotchLengthController = TextEditingController();

//   late TextEditingController stairsCountController = TextEditingController();
//   late TextEditingController lowerFlatPostCountController = TextEditingController();
//   late TextEditingController rampPostCountController = TextEditingController();
//   late TextEditingController upperFlatPostCountController = TextEditingController();

//   late TextEditingController stairNumberController = TextEditingController();

//   late bool _hasTopCrotch;
//   late bool _hasBottomCrotch;

//   late List<Post> _lowerFlatPost;
//   late List<Post> _rampPost;
//   late List<Post> _upperFlatPost;

//   //late dynamic flatDistance;
//   //late double postDistance;
//   //late int stairNum;

//   @override
//   void initState() {
//     super.initState();
//     riserController.text = '6.7875'; //userInputs['riser'];
//     bevelController.text = '7.3125';

//     stairsCountController.text = '6';

//     topCrotchLengthController.text = '0';
//     bottomCrotchLengthController.text = '0';

//     lowerFlatPostCountController.text = '0';
//     rampPostCountController.text = '0';
//     upperFlatPostCountController.text = '0';

//     _hasTopCrotch = true;
//     _hasBottomCrotch = true;
//     // _lowerFlatPost = [];
//     _rampPost = [];
//     _upperFlatPost = [];
//   }

//   @override
//   void dispose() {
//     riserController.dispose();
//     bevelController.dispose();
//     stairsCountController.dispose();

//     topCrotchLengthController.dispose();
//     bottomCrotchLengthController.dispose();
//     lowerFlatPostCountController.dispose();
//     rampPostCountController.dispose();
//     upperFlatPostCountController.dispose();

//     super.dispose();
//   }

//   static const double containerWidth = 300.0;

//   @override
//   Widget build(BuildContext context) {
//     // final double containerWidth = context.size!.width;
//     final lastInputsValues = context.read<UserInput>().textFormFields;
//     final userInputsProvider = context.read<UserInput>();

//     // Initiate Values
//     // riserController.text = lastInputsValues['riser']; //userInputs['riser'];
//     _lowerFlatPost = lastInputsValues['lowerFlatPost'];

//     List<String> alphabet = List.generate(26, (index) => String.fromCharCode(index + 65));
//     print('out ${_lowerFlatPost}');

//     void resetView() {
//       setState(() {
//         print("object");
//       });
//     }

//     return ListView(
//       children: [
//         Wrap(
//           alignment: WrapAlignment.spaceEvenly,
//           children: [
//             TextFormInput(
//               containerWidth: containerWidth,
//               controler: riserController,
//               provider: userInputsProvider,
//               inputLabel: "Riser",
//               field: "riser",
//             ),
//             TextFormInput(containerWidth: containerWidth, controler: bevelController, provider: userInputsProvider, inputLabel: "Bevel", field: "bevel"),

//             // Top Crotch
//             SizedBox(
//               width: containerWidth,
//               child: Container(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Column(
//                   children: [
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                       const Text("Top Crotch:"),
//                       Checkbox(
//                           fillColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
//                           value: _hasTopCrotch,
//                           onChanged: (value) {
//                             setState(() {
//                               _hasTopCrotch = !_hasTopCrotch;
//                               userInputsProvider.updateFields('topCrotch', _hasTopCrotch);
//                             });
//                           })
//                     ]),
//                     if (_hasTopCrotch) ...{
//                       TextFormInput(
//                         containerWidth: containerWidth,
//                         controler: topCrotchLengthController,
//                         provider: userInputsProvider,
//                         inputLabel: "Distance",
//                         field: "topCrotchLength",
//                         padding: 5.0,
//                       )
//                     },
//                   ],
//                 ),
//               ),
//             ),

//             // Bottom Croth
//             SizedBox(
//               width: containerWidth,
//               child: Container(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Column(
//                   children: [
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                       const Text("Bottom Crotch:"),
//                       Checkbox(
//                           fillColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
//                           value: _hasBottomCrotch,
//                           onChanged: (value) {
//                             setState(() {
//                               _hasBottomCrotch = !_hasBottomCrotch;
//                               userInputsProvider.updateFields('bottomCrotch', _hasBottomCrotch);
//                             });
//                           })
//                     ]),
//                     if (_hasBottomCrotch) ...{
//                       TextFormInput(
//                         containerWidth: containerWidth,
//                         controler: bottomCrotchLengthController,
//                         provider: userInputsProvider,
//                         inputLabel: "Distance",
//                         field: "bottomCrotchLength",
//                         padding: 5.0,
//                       )
//                     },
//                   ],
//                 ),
//               ),
//             ),

//             // // Stairs
//             TextFormInput(
//                 containerWidth: containerWidth,
//                 controler: stairsCountController,
//                 provider: userInputsProvider,
//                 inputLabel: "Number of Stairs",
//                 field: "stairsCount"),
//             if (_lowerFlatPost.isNotEmpty) ...[
//               const SizedBox(
//                 width: containerWidth,
//               ),
//             ],

//             // Lower Flat Post
//             SizedBox(
//                 width: containerWidth,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0),
//                       child: SizedBox(
//                           width: containerWidth,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text('Lower Flat Post'),
//                               ElevatedButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       // _lowerFlatPost.add(Post(distance: 0.0));
//                                     });
//                                   },
//                                   child: const Icon(Icons.add))
//                             ],
//                           )
//                           // Focus(
//                           //   child: TextFormField(
//                           //     autovalidateMode: AutovalidateMode.onUserInteraction,
//                           //     validator: (value) {
//                           //       if (value == null || value.isEmpty || double.tryParse(value) == null) {
//                           //         return "Please enter valid number";
//                           //       }
//                           //       return null;
//                           //     },
//                           //     onTap: () => lowerFlatPostCountController.selection =
//                           //         TextSelection(baseOffset: 0, extentOffset: lowerFlatPostCountController.value.text.length),
//                           //     controller: lowerFlatPostCountController,
//                           //     decoration: const InputDecoration(
//                           //       labelText: "Lower Flat Post",
//                           //     ),
//                           //   ),
//                           //   onFocusChange: (value) {
//                           //     int lowerFlatPostCount = int.parse(lowerFlatPostCountController.text);
//                           //     List<Post> tempMaps = [];
//                           //     if (lowerFlatPostCount > 0) {
//                           //       for (int i = 0; i < lowerFlatPostCount; i++) {
//                           //         tempMaps.add(Post(distance: 0.0));
//                           //       }
//                           //     }
//                           //     setState(() {
//                           //       _lowerFlatPost = [...tempMaps];
//                           //     });
//                           //   },
//                           // ),
//                           ),
//                     ),
//                     const SizedBox(
//                       height: 10.0,
//                     ),
//                     const Divider(
//                       height: 2.0,
//                     ),
//                     if (_lowerFlatPost.isNotEmpty) ...[
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                       FlatPostTable(postList: _lowerFlatPost, flatposition: "lowerFlatPost", resetView: resetView)
//                     ],
//                   ],
//                 )),

//             // Ramp Post
//             SizedBox(
//                 width: containerWidth,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: SizedBox(
//                         width: containerWidth,
//                         child: Focus(
//                           child: TextFormField(
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             validator: (value) {
//                               if (value == null || value.isEmpty || double.tryParse(value) == null) {
//                                 return "Please enter valid number";
//                               }
//                               return null;
//                             },
//                             onTap: () =>
//                                 rampPostCountController.selection = TextSelection(baseOffset: 0, extentOffset: rampPostCountController.value.text.length),
//                             controller: rampPostCountController,
//                             decoration: const InputDecoration(
//                               labelText: "Post",
//                             ),
//                           ),
//                           onFocusChange: (value) {
//                             int rampPostCount = int.parse(rampPostCountController.text);
//                             List<Post> tempMaps = [];
//                             if (rampPostCount > 0) {
//                               for (int i = 0; i < rampPostCount; i++) {
//                                 //tempMaps.add(Post(distance: 0.0));
//                               }
//                             }
//                             setState(() {
//                               _rampPost = [...tempMaps];
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     if (_rampPost.isNotEmpty) ...[
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                       FlatPostTable(postList: _rampPost, flatposition: "lowerFlatPost", resetView: resetView,  resetView: resetView)
//                     ],
//                   ],
//                 )),

//             // Upper Flat Post
//             SizedBox(
//                 width: containerWidth,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: SizedBox(
//                         width: containerWidth,
//                         child: Focus(
//                           child: TextFormField(
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             validator: (value) {
//                               if (value == null || value.isEmpty || double.tryParse(value) == null) {
//                                 return "Please enter valid number";
//                               }
//                               return null;
//                             },
//                             onTap: () => upperFlatPostCountController.selection =
//                                 TextSelection(baseOffset: 0, extentOffset: upperFlatPostCountController.value.text.length),
//                             controller: upperFlatPostCountController,
//                             decoration: const InputDecoration(
//                               labelText: "Upper Flat Post",
//                             ),
//                           ),
//                           onFocusChange: (value) {
//                             int upperFlatPostCount = int.parse(upperFlatPostCountController.text);
//                             List<Post> tempMaps = [];
//                             if (upperFlatPostCount > 0) {
//                               for (int i = 0; i < upperFlatPostCount; i++) {
//                                 //tempMaps.add(Post(distance: 0.10));
//                               }
//                             }
//                             setState(() {
//                               _upperFlatPost = [...tempMaps];
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     if (_upperFlatPost.isNotEmpty) ...[
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                       FlatPostTable(postList: _upperFlatPost, flatposition: "lowerFlatPost", resetView: resetView)
//                     ],
//                   ],
//                 )),

//             const SizedBox(
//               width: containerWidth,
//             )
//           ],
//         )
//       ],
//     );

//     //               width: containerWidth,
//     //             )
//     //           ],
//     //         ),
//     //         Padding(
//     //           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//     //           child: Column(
//     //             children: [
//     //               SizedBox(
//     //                 width: containerWidth,
//     //                 child: ElevatedButton(
//     //                   // style: ButtonStyle(
//     //                   //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
//     //                   // ),
//     //                   onPressed: () {},
//     //                   child: const Text('Submit'),
//     //                 ),
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //       ],
//     //     ));
//   }
// }

// class TextFormInput extends StatelessWidget {
//   const TextFormInput({
//     Key? key,
//     required this.containerWidth,
//     required this.controler,
//     required this.provider,
//     required this.inputLabel,
//     required this.field,
//     this.padding = 10.0,
//     //required this.validator
//   }) : super(key: key);

//   final double containerWidth;
//   final TextEditingController controler;
//   final UserInput provider;
//   final String inputLabel;
//   final String field;
//   final double padding;
//   //final String validator;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: padding),
//       child: SizedBox(
//         width: containerWidth,
//         child: Focus(
//           child: TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value == null || value.isEmpty || double.tryParse(value) == null) {
//                 return "Please enter valid number";
//               }
//               return null;
//             },
//             onTap: () => controler.selection = TextSelection(baseOffset: 0, extentOffset: controler.value.text.length),
//             controller: controler,
//             decoration: InputDecoration(
//               labelText: inputLabel,
//             ),
//           ),
//           onFocusChange: (value) {
//             if (controler.value.text.trim().isNotEmpty || double.tryParse(controler.value.text) != null) {
//               provider.updateFields(field, controler.text);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
