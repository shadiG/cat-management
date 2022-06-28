import 'package:flutter/material.dart';

class MainListNotifier extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}
