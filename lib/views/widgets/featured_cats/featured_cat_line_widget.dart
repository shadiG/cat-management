import 'package:cat_management/data/entities/featured_cat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/tab_controller.dart';
import '../../../data/others/application.dart';
import '../../../data/others/main_list_notifier.dart';
import '../../../data/repositories/featured_cat_repository.dart';
import '../../../utils/app_theme_data.dart';
import '../../../utils/constants.dart';
import '../gradient_button.dart';
import '../image_displayer.dart';

class FeaturedCatLineWidget extends StatefulWidget {
  FeaturedCat? featuredCat;
  FeaturedCatLineWidget(this.featuredCat, {Key? key}) : super(key: key);

  @override
  State<FeaturedCatLineWidget> createState() => _FeaturedCatLineWidgetState();
}

class _FeaturedCatLineWidgetState extends State<FeaturedCatLineWidget> {
  bool hasBeenAdded = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkAppartenance();
    });
  }

  void checkAppartenance() {
    FeaturedCatRepository.isHisFeaturedCat(widget.featuredCat!).then((value) {
      if (mounted) {
        setState(() {
          hasBeenAdded = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          child: ImageDisplayer(widget.featuredCat?.catPicture),
          borderRadius: BorderRadius.circular(20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.vertical,
            children: [
              Text(
                widget.featuredCat?.name ?? "",
                style: AppThemeData.catNameStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: SizedBox(
                  width: Constants.secondBlockWidth,
                  child: Text(widget.featuredCat?.description ?? "",
                      style: AppThemeData.catDescriptionStyle),
                ),
              ),
              Consumer<MainListNotifier>(builder: (context, _, __) {
                checkAppartenance();
                return (hasBeenAdded == true)
                    ? GradientButton(
                        onButtonPressed: () {
                          if (Application.catHolder != null &&
                              widget.featuredCat != null) {
                            HomeTabController.removeAFeaturedCat(
                                Application.catHolder!,
                                widget.featuredCat!,
                                context);
                            setState(() {
                              hasBeenAdded = !hasBeenAdded;
                            });
                          }
                        },
                        buttonType: ButtonType.remove,
                      )
                    : GradientButton(
                        onButtonPressed: () {
                          if (Application.catHolder != null &&
                              widget.featuredCat != null) {
                            HomeTabController.addAFeaturedCat(
                                Application.catHolder!,
                                widget.featuredCat!,
                                context);
                            setState(() {
                              hasBeenAdded = !hasBeenAdded;
                            });
                          }
                        },
                        buttonType: ButtonType.add,
                      );
              })
            ],
          ),
        )
      ],
    );
  }
}
