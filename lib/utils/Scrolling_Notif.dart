// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  bool isScrolling = false;

  bool get MyVariables => isScrolling;

  set MyVariables(bool newValue) {
    isScrolling = newValue;
    notifyListeners();
  }
}
