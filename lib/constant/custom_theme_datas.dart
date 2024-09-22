import 'dart:io';

import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomThemeDatas {
  static ThemeData general = ThemeData(
    brightness: Platform.isIOS ? Brightness.light : Brightness.dark,
    primaryColor: CustomColors.mainColor,
    scaffoldBackgroundColor: CustomColors.backgroundColor,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
  );
}
