import 'package:flutter/material.dart';

import '../widget//Post.dart';
import '../widget/Rampost.dart';

class UserInput extends ChangeNotifier {
  // late String _inputOne = "";
  // late final String _inputTwo = '';

  late final Map _textFormFields = {
    'id': 0,
    "riser": '6.6875', //
    "bevel": '7.3125',
    "topCrotch": false,
    //"topCrotchHeight": '8.0',
    "topCrotchLength": '0.0',
    "bottomCrotch": false,
    //"bottomCrotchHeight": '8.0',
    //"btmError": false,
    "upFlatError": false,
    "bottomCrotchLength": '0.0',
    'bottomCrotchTextEnable': true,
    "lowerFlatPost": <Post>[
      //Post(distance: 5.0, embeddedType: 'none')
    ], //Post(distance: 10.0, embeddedType: 'sleeve')
    "rampPost": <RampPost>[
      //RampPost(nosingDistance: 0.0, balusterDistance: 0.0, embeddedType: 'none', step: 1),
      //RampPost(nosingDistance: 6.0, balusterDistance: 5.4, embeddedType: 'none', step: 4),
      //RampPost(nosingDistance: 0.0, balusterDistance: 0.0, embeddedType: 'none', step: 6),
      //RampPost(nosingDistance: 12.0, balusterDistance: 5.5, embeddedType: 'none', step: 8),
      // RampPost(nosingDistance: 0.0, balusterDistance: 0.0, embeddedType: 'none', step: 10),
      // RampPost(nosingDistance: 0.0, balusterDistance: 0.0, embeddedType: 'none', step: 12),
      // RampPost(nosingDistance: 0.0, balusterDistance: 0.0, embeddedType: 'none', step: 14),
      // RampPost(nosingDistance: 0.0, balusterDistance: 0.0, embeddedType: 'none', step: 16),
    ], //RampPost(nosingDistance: 0.0, balusterDistance: 0.0, embeddedType: 'none', step: 5)
    "upperFlatPost": <Post>[
      //Post(distance: 6.0, embeddedType: 'none')
    ], //Post(distance: 10.0, embeddedType: 'none')
    "stairsCount": '18',

    "currentFocus": FocusNode(),
    //'bottomFlatPostEnable': true,
    'active': true,
    'enableBtn': true,
    'hasBottomCrotchPost': false
  };
  get textFormFields => _textFormFields;

  void updateFields(key, value) {
    _textFormFields[key] = value;

    notifyListeners();
  }
  //final Map _template = {
  //   "riser": '6.6875', //
  //   "bevel": '7.3125',
  //   "topCrotch": false,

  //   "topCrotchLength": '0.0',
  //   "bottomCrotch": true,

  //   //"upFlatError": false,
  //   "bottomCrotchLength": '0.0',
  //   //'bottomCrotchTextEnable': true,
  //   "lowerFlatPost": <Post>[],
  //   "rampPost": <RampPost>[],
  //   "upperFlatPost": <Post>[],
  //   "stairsCount": '16',

  //   "currentFocus": FocusNode(),
  //   'bottomFlatPostEnable': true,
  //   'active': true,
  //   'hasBottomCrotchPost': false
  // };

  // // get inputOne => _inputOne;
  // // get inputTwo => _inputTwo;

  // void usInputModifier(value) {
  //   _inputOne = value;
  //   notifyListeners();
  // }
}
