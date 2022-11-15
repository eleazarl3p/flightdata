import 'package:flutter/cupertino.dart';

import '../models/poste.dart';
import '../models/poste_de_tramo.dart';

class FlightProvider extends ChangeNotifier {
   String _flightName = 'New Flight';
   double _riser = 6.6875;
   double _bevel = 7.3125;
   double _topCrotchDistance = 0.0;
   double _bottomCrotchDistance = 0.0;

   bool _topCrotch = true;
   bool _bottomCrotch = true;
   bool _bottomCrotchPost = true;

   int _numberOfSteps = 12;

   List<Poste> _bottomPostList = [];
   List<Poste> _topPostList = [];
   List<PosteDeTramo> _rampPostList = [];


  FlightProvider();

  get flightName => _flightName;
  get riser => _riser;
  get bevel => _bevel;
  get topCrotchDistance => _topCrotchDistance;
  get bottomCrotchDistance => _bottomCrotchDistance;
  get topCrotch => _topCrotch;
  get bottomCrotch => _bottomCrotch;
  get bottomCrotchPost => _bottomCrotchPost;
  get numberOfStep => _numberOfSteps;
  get bottomPostList => _bottomPostList;
  get topPostList => _topPostList;
  get rampPostList => _rampPostList;

  set setFlightName (String flightName) {
    _flightName = flightName;
    notifyListeners();
  }

   set setRiser (double riser) {
     _riser = riser;
     notifyListeners();
   }

   set setBevel (double bevel) {
     _bevel = bevel;
     notifyListeners();
   }

   set setTopCrotchDistance (double tcd) {
     _topCrotchDistance = tcd;
     notifyListeners();
   }

   set setBottomCrotchDistance (double bcd) {
     _bottomCrotchDistance = bcd;
     notifyListeners();
   }

   set setNumberOfSteps (int ns) {
     _numberOfSteps = ns;
     notifyListeners();
   }

   set toggleTopCrotch (int tc) {
    _topCrotch = !_topCrotch;
    notifyListeners();
   }

   set toggleBottomCrotch (int tb) {
     _bottomCrotch = !_bottomCrotch;
     notifyListeners();
   }

   set toggleBottomCrotchPost (int btc) {
     _bottomCrotchPost = !_bottomCrotchPost;
     notifyListeners();
   }

   // set setFlightName (String flightName) {
   //   _flightName = flightName;
   //   notifyListeners();
   // }


}