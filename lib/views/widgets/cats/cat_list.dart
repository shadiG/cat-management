import 'package:cat_management/data/repositories/cat_repository.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controllers/tab_controller.dart';
import '../../../data/entities/cat.dart';
import '../loading_list_widget.dart';
import 'cat_line_widget.dart';

class CatList extends StatelessWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkCallWidget(
        child: StreamBuilder<QuerySnapshot>(
            stream: CatRepository.getAll(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              List<Widget> children;
              if (!snapshot.hasData) {
                children = [const LoadingCatWidget()];
              } else {
                if (snapshot.hasError) {
                  children = [const NetErrorWidget()];
                } else {
                  List<Cat>? cats =
                      HomeTabController.processChangedCatList(snapshot);
                  children = <Widget>[
                    ListView.separated(
                      itemCount: cats?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (cats?.isNotEmpty ?? false) {
                          return CatLineWidget(cats!.elementAt(index));
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
            }));
  }
}
