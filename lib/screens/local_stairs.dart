// //import 'package:flutter/cupertino.dart';
// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/providers/Stair.dart';
// import 'package:flutter_application_1/providers/rampa_provider.dart';
// //import 'package:flutter_application_1/screens/flight_editor.dart';
// import 'package:provider/provider.dart';
//
// import '../widget//Post.dart';
// import '../widget/Rampost.dart';
// //import 'package:flutter/src/widgets/container.dart';
// //import 'package:flutter/src/widgets/framework.dart';
// //import 'escalera.dart';
//
// class LocalStair extends StatefulWidget {
//   const LocalStair({super.key});
//
//   @override
//   State<LocalStair> createState() => _StairState();
// }
//
// class _StairState extends State<LocalStair> {
//   @override
//   Widget build(BuildContext context) {
//     Stair currentStair = context.watch<Stair>();
//     Map flights = currentStair.flights;
//     List llaves = flights.keys.toList();
//     //List myStairs = AllStairs().myStairs;
//
//     final usrInput = context.watch<UserInput>();
//     Map newMap = usrInput.textFormFields;
//     // print('object');
//     // print(uu.textFormFields);
//
//     //print('object ${allStairs.myStairs.length}');
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text("**Titutlo va aqui")),
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.blueGrey.shade400,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             backgroundBlendMode: BlendMode.colorBurn, color: Colors.white12),
//         child: Column(
//             //crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Divider(
//                 thickness: 3.0,
//               ),
//               Expanded(
//                 child: Row(children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             margin: EdgeInsets.all(15),
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(width: 2.0, color: Colors.black),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Column(children: [
//                               Expanded(
//                                 child: ListView.builder(
//                                   padding: const EdgeInsets.all(10.0),
//                                   itemCount: currentStair.flights.length,
//                                   itemBuilder: ((context, index) {
//                                     Map flight = flights[llaves[index]];
//                                     return Card(
//                                       color: Colors.brown.shade100,
//                                       child: ListTile(
//                                         leading: Text('Flight ${flight["id"]}'),
//                                         trailing: Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               TextButton.icon(
//                                                   onPressed: () {
//                                                     int _id =
//                                                         flights[llaves.last]
//                                                                 ['id'] +
//                                                             1;
//                                                     Map currentFlight =
//                                                         flights[llaves[index]];
//                                                     //currentFlight['id'] = _id;
//                                                     currentFlight
//                                                         .forEach((key, value) {
//                                                       usrInput.updateFields(
//                                                           key, value);
//                                                     });
//                                                     usrInput.updateFields(
//                                                         'id', _id);
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder:
//                                                                 ((context) =>
//                                                                     FlightEditor(
//                                                                       flightName:
//                                                                           _id.toString(),
//                                                                     ))));
//                                                   },
//                                                   icon: const Icon(Icons.copy),
//                                                   label: const Text('Copy')),
//                                               TextButton.icon(
//                                                   onPressed: () {
//                                                     flight
//                                                         .forEach((key, value) {
//                                                       usrInput.updateFields(
//                                                           key, value);
//                                                     });
//
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: ((context) =>
//                                                                 FlightEditor(
//                                                                     flightName:
//                                                                         llaves[
//                                                                             index]))));
//                                                   },
//                                                   icon: const Icon(Icons.edit),
//                                                   label: const Text('Edit')),
//                                               TextButton.icon(
//                                                   onPressed: (() {
//                                                     //Map flight = flights[llaves[index]];
//                                                     currentStair.removeFlight(
//                                                         llaves[index]);
//                                                   }),
//                                                   icon:
//                                                       const Icon(Icons.delete),
//                                                   label: const Text('Delete')),
//                                             ]),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20.0,
//                               ),
//                             ]),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         )
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//
//                           SizedBox(
//                             width: 200.0,
//                             child: ElevatedButton(
//                               child: const Text('Add Flight'),
//                               onPressed: () {
//                                 scratchTemplate(llaves, flights, usrInput,
//                                     context, currentStair);
//                               },
//                             ),
//                           ),
//
//                           const SizedBox(
//                             height: 30.0,
//                           ),
//                           SizedBox(
//                             width: 200.0,
//                             child: ElevatedButton(
//                               child: const Text(' Submit '),
//                               onPressed: () {
//                                 //FirebaseFirestore.instance.collection('fligtsdata').add({'riser': 88935});
//                                 var dataJson = currentStair.misF();
//
//                                 FirebaseFirestore.instance
//                                     .collection('fligtsdata')
//                                     .add({'escalera': dataJson});
//                                 //print(jsonEncode(allFlights.misF()));
//                                 //print(dataToJson);
//                                 currentStair.clearFlights();
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//               ),
//             ]),
//       ),
//     );
//   }
//
//   void scratchTemplate(List<dynamic> llaves, Map<dynamic, dynamic> flights,
//       UserInput usrInput, BuildContext context, Stair currentStair) {
//     int _id;
//     if (llaves.isNotEmpty) {
//       _id = flights[llaves.last]['id'] + 1;
//     } else {
//       _id = 1;
//     }
//
//     Map template = {
//       'id': _id,
//       "riser": '6.6875', //
//       "bevel": '7.3125',
//       "topCrotch": false,
//
//       "topCrotchLength": '0.0',
//       "bottomCrotch": true,
//
//       "upFlatError": false,
//       "bottomCrotchLength": '0.0',
//       'bottomCrotchTextEnable': true,
//       "lowerFlatPost": <Post>[],
//       "rampPost": <RampPost>[],
//       "upperFlatPost": <Post>[],
//       "stairsCount": '18',
//
//       "currentFocus": FocusNode(),
//       //'bottomFlatPostEnable': true,
//       'active': true,
//       'hasBottomCrotchPost': false
//     };
//     template.forEach((key, value) {
//       usrInput.updateFields(key, value);
//     });
//
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: ((context) => FlightEditor(
//               flightName: _id.toString(),
//                 ))));
//   }
// }
