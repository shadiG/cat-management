import 'package:cat_management/data/services/home_page_services.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await HomePageServices.appInitialization();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
