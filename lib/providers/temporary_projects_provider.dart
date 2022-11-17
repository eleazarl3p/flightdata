import 'package:flutter/foundation.dart';

import '../models/proyecto.dart';

class Projects extends ChangeNotifier{
  final List<Proyecto> _projects = [];

  Projects();

  get projects => _projects;

  void addProject(Proyecto proyecto) {
    _projects.add(proyecto);
  }

  void removeProject(Proyecto proyecto) {
    _projects.remove(proyecto);
  }

}