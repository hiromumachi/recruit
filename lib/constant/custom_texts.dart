import 'package:recruitfrontend/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class CustomTexts {
  static const fontFamily = FontFamily.notoSansJP;

  static const titleSize = 24.0;
  static const bodySize = 16.0;
  static const captionSize = 12.0;
  static const minimum = 10.0;

  static const titleStyle = TextStyle(
    fontSize: titleSize,
    fontFamily: fontFamily,
  );

  static const bodyStyle = TextStyle(
    fontSize: bodySize,
    fontFamily: fontFamily,
  );

  static const bodyStyleBold = TextStyle(
    fontSize: bodySize,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const captionStyle = TextStyle(
    fontSize: captionSize,
    fontFamily: fontFamily,
  );

  static const minimumStyle = TextStyle(
    fontSize: minimum,
    fontFamily: fontFamily,
  );
}
