import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_theme_data.dart';
import '../widgets/cats/cat_list.dart';
import '../widgets/featured_cats/featured_cat_list.dart';

class CatsTab extends StatelessWidget {
  const CatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured",
            style: AppThemeData.lineStyle,
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: FeaturedCatList(),
          ),
          Text(
            "All cats",
            style: AppThemeData.lineStyle,
            textAlign: TextAlign.left,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: CatList(),
          ),
        ],
      )),
    );
  }
}
