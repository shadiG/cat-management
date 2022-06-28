import 'package:flamingo/flamingo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controllers/tab_controller.dart';
import '../../../data/entities/featured_cat.dart';
import '../../../data/repositories/featured_cat_repository.dart';
import '../featured_cats/featured_cat_line_widget.dart';
import '../loading_list_widget.dart';

class MyFeaturedCat extends StatelessWidget {
  const MyFeaturedCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FeaturedCatRepository.getHisFeaturedCat(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<Widget> children;
          if (!snapshot.hasData) {
            children = [const LoadingCatWidget()];
          } else {
            if (snapshot.hasError) {
              children = [const NetErrorWidget()];
            } else {
              List<FeaturedCat>? featuredCats =
                  HomeTabController.processChangedFeaturedCatList(snapshot);
              children = <Widget>[
                ListView.separated(
                  itemCount: featuredCats?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    if (featuredCats?.isNotEmpty ?? false) {
                      return FeaturedCatLineWidget(
                          featuredCats!.elementAt(index));
                    } else {
                      return const SizedBox();
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )
              ];
            }
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}
