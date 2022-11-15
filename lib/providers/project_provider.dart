import 'package:flutter/foundation.dart';

import '../models/escalera.dart';

class ProjectProvider extends ChangeNotifier{

  String name = '';
  List<Escalera> _stairsList = <Escalera> [];
  ProjectProvider();

  void addStair(Escalera escalera) {
    _stairsList.add(escalera);
    notifyListeners();
  }
  get stairsList => _stairsList;


  void removeStair(int index) {
    _stairsList.removeAt(index);
    notifyListeners();
  }
}