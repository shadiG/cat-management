import 'package:cat_management/utils/home_page_services.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  HomePageServices.appInitialization();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
