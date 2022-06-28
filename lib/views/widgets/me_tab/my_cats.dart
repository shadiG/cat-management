import 'package:flamingo/flamingo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controllers/tab_controller.dart';
import '../../../data/entities/cat.dart';
import '../../../data/repositories/cat_repository.dart';
import '../cats/cat_line_widget.dart';
import '../loading_list_widget.dart';

class MyCat extends StatelessWidget {
  const MyCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: CatRepository.getHisCat(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<Widget> children;
          if (!snapshot.hasData) {
            children = [const LoadingCatWidget()];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                    'Sorry, we have some problems loading featured cats 😿'),
              )
            ];
          } else {
            List<Cat>? cats = HomeTabController.processChangedCatList(snapshot);
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}
