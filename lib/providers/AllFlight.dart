import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/rampa_provider.dart';

class AllFlight extends ChangeNotifier {
  // late String _inputOne = "";
  // late final String _inputTwo = '';

  late final Map<int, Map> _MyFlights = {};

  // get inputOne => _inputOne;
  // get inputTwo => _inputTwo;
  get flights => _MyFlights;

  void addFlight(int flightNumber, Map stairInfo) {
    _MyFlights.addEntries({flightNumber: stairInfo}.entries);

    notifyListeners();
  }

  void removeFlight(int flightNumber) {
    _MyFlights.remove(flightNumber);
    notifyListeners();
  }
  // void updateFields(key, value) {
  //   _textFormFields[key] = value;
  //   notifyListeners();
  // }

  // void usInputModifier(value) {
  //   _inputOne = value;
  //   notifyListeners();
  // }
}
