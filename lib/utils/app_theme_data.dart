import 'package:flutter/cupertino.dart';

class AppThemeData {
  static TextStyle lineStyle =
      const TextStyle(color: CupertinoColors.black, fontSize: 25);

  static TextStyle catNameStyle =
      const TextStyle(fontSize: 22, color: CupertinoColors.black);

  static TextStyle catDescriptionStyle = const TextStyle(
    fontSize: 15,
    color: CupertinoColors.black,
    fontWeight: FontWeight.w200,
    overflow: TextOverflow.visible,
  );
}
