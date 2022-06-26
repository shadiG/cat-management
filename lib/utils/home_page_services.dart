import 'package:flamingo/flamingo.dart';
import 'package:flutter/cupertino.dart';

class HomePageServices {
  static void appInitialization() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Flamingo
        .initializeApp(); // flamingo initialize Firebase at the same time
  }
}
