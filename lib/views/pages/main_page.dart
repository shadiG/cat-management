import 'package:cat_management/views/pages/me_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'cats_tab.dart';

class MainPage extends StatelessWidget {
  static const List<Widget> pages = [CatsTab(), MeTab()];
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoTabScaffold(
      backgroundColor: Colors.white,
      tabBar: CupertinoTabBar(
        // backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.hare),
            label: Constants.cats,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: Constants.me,
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return pages[index];
          },
        );
      },
    ));
  }
}
