import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/tab_controller.dart';
import '../../../data/entities/cat.dart';
import '../../../data/others/application.dart';
import '../../../data/others/main_list_notifier.dart';
import '../../../data/repositories/cat_repository.dart';
import '../../../utils/app_theme_data.dart';
import '../../../utils/constants.dart';
import '../gradient_button.dart';
import '../image_displayer.dart';

class CatLineWidget extends StatefulWidget {
  Cat? cat;
  CatLineWidget(this.cat, {Key? key}) : super(key: key);

  @override
  State<CatLineWidget> createState() => _CatLineWidgetState();
}

class _CatLineWidgetState extends State<CatLineWidget> {
  bool hasBeenAdded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkAppartenance();
    });
  }

  void checkAppartenance() {
    CatRepository.isHisCat(widget.cat!).then((value) {
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
          child: ImageDisplayer(widget.cat?.catPicture),
          borderRadius: BorderRadius.circular(20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.vertical,
            children: [
              Text(
                widget.cat?.name ?? "",
                style: AppThemeData.catNameStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: SizedBox(
                  width: Constants.secondBlockWidth,
                  child: Text(widget.cat?.description ?? "",
                      style: AppThemeData.catDescriptionStyle),
                ),
              ),
              Consumer<MainListNotifier>(builder: (context, _, __) {
                checkAppartenance();
                return (hasBeenAdded == true)
                    ? GradientButton(
                        onButtonPressed: () {
                          if (Application.catHolder != null &&
                              widget.cat != null) {
                            HomeTabController.removeACat(
                                Application.catHolder!, widget.cat!, context);
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
                              widget.cat != null) {
                            HomeTabController.addACat(
                                Application.catHolder!, widget.cat!, context);
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
