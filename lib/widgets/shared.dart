import 'package:flutter/material.dart';
import 'package:inchallahlist/utils/colors.dart';

class SharedWidgets {
  static Gradient gradientBg() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        MyColors.pinkPrimary,
        MyColors.purpelPrimary,
      ],
    );
  }
}
