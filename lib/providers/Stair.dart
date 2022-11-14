import 'package:flutter/material.dart';

class Stair extends ChangeNotifier {
  // late String _inputOne = "";
  // late final String _inputTwo = '';

  late final Map<String, Map> _MyFlights = {};

  // get inputOne => _inputOne;
  // get inputTwo => _inputTwo;
  get flights => _MyFlights;

  // void addFlight(int flightNumber, UserInput stairInfo) {
  //   _MyFlights.addEntries({flightNumber: stairInfo}.entries);

  //   notifyListeners();
  // }

  void addFlight(String flightName, Map stairInfo) {
    _MyFlights.addEntries({flightName: stairInfo}.entries);

    notifyListeners();
  }

  void removeFlight(int flightNumber) {
    _MyFlights.remove(flightNumber);
    notifyListeners();
  }

  void clearFlights() {
    _MyFlights.clear();
    notifyListeners();
  }

  List<dynamic> jsonData = [];
  misF() {
    for (var items in _MyFlights.entries) {
      FlightObj obj = FlightObj(
        riser: double.parse(items.value['riser']),
        bevel: double.parse(items.value['bevel']),
        numOfStep: int.parse(items.value['stairsCount']),
        topCrotch: items.value['topCrotch'],
        topCrotchLength: double.parse(items.value['topCrotchLength']),
        bottomCrotch: items.value['bottomCrotch'],
        bottomCrotchLength: double.parse(items.value['bottomCrotchLength']),
        //bottomCrotchPost: items.value['bottomCrotchPost']
      );
      jsonData.add(obj.toJson());
    }
    return jsonData;
  }
}

class FlightObj {
  final double riser;
  final double bevel;

  final bool topCrotch;
  final double topCrotchLength;
  final bool bottomCrotch;
  final double bottomCrotchLength;
  //final bool bottomCrotchPost;
  final int numOfStep;

  // final List bottomPost;
  // final List rampost;
  // final List topPost;

  FlightObj({
    required this.riser,
    required this.bevel,
    required this.topCrotch,
    required this.topCrotchLength,
    required this.bottomCrotch,
    required this.bottomCrotchLength,
    //required this.bottomCrotchPost,
    required this.numOfStep,
  });

  Map toJson() => {
        'riser': riser,
        'bevel': bevel,
        'topCrotch': topCrotch,
        'topCrotchLength': topCrotchLength,
        'bottomCrotch': bottomCrotch,
        'bottomCrotchLength': bottomCrotchLength,
        //'bottomCrotchPost': bottomCrotchPost,
        'numOfStep': numOfStep
      };
}
