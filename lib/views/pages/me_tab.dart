import 'package:cat_management/views/widgets/me_tab/my_featured_cat.dart';
import 'package:flutter/material.dart';

import '../../data/others/application.dart';
import '../../utils/app_theme_data.dart';
import '../widgets/image_displayer.dart';
import '../widgets/me_tab/my_cats.dart';

class MeTab extends StatelessWidget {
  const MeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            child: Stack(
              children: [
                Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Application.catHolder?.name ?? "",
                        style: AppThemeData.lineStyle,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Age: ${Application.catHolder?.age}",
                        style: AppThemeData.lineStyle,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  alignment: Alignment.topLeft,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    child: ImageDisplayer(Application.catHolder?.avatar),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          ),
          Text(
            "My Cats",
            style: AppThemeData.lineStyle,
            textAlign: TextAlign.left,
          ),
          const MyFeaturedCat(),
          const MyCat()
        ],
      )),
    );
  }
}