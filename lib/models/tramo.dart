import 'package:flutter_application_1/models/poste.dart';
import 'package:flutter_application_1/models/poste_de_tramo.dart';

class Tramo {
  String flightName;
  double riser;
  double bevel;
  double topCrotchDistance;
  double bottomCrotchDistance;

  bool topCrotch;
  bool bottomCrotch;
  bool bottomCrotchPost;

  int numberOfStep;

  List<Poste> bottomPostList;
  List<Poste> topPostList;
  List<PosteDeTramo> rampPostList;


  Tramo({required this.flightName, required this.riser, required this.bevel, required this.topCrotchDistance, required this.bottomCrotchDistance,
  required this.topCrotch, required this.bottomCrotch, required this.bottomCrotchPost, required this.numberOfStep,
    required this.bottomPostList, required this.topPostList, required this.rampPostList

  });



}