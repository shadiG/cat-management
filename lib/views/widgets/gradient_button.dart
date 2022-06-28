import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';

class GradientButton extends StatelessWidget {
  Function onButtonPressed;
  ButtonType buttonType;
  GradientButton(
      {Key? key, required this.onButtonPressed, required this.buttonType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onButtonPressed.call();
      },
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: (buttonType == ButtonType.add)
              ? [HexColor.fromHex("#FFAB91"), HexColor.fromHex("#FF6F43")]
              : [HexColor.fromHex("#E0E0E000"), HexColor.fromHex("#E0E0E000")],
        )),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          (buttonType == ButtonType.add) ? Constants.add : Constants.remove,
          textAlign: TextAlign.center,
          style: TextStyle(
              color:
                  (buttonType == ButtonType.add) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

enum ButtonType { add, remove }
