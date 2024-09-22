import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingUtil {
  static const indicatorSize = 80.0;

  static void initialize() {
    EasyLoading.instance
      ..indicatorSize = indicatorSize
      ..radius = 12
      ..fontSize = CustomTexts.bodySize
      ..textPadding = const EdgeInsets.only(left: 16, right: 16, bottom: 8)
      ..contentPadding = const EdgeInsets.all(8)
      ..backgroundColor = CustomColors.mainColor
      ..maskColor = Colors.transparent
      ..progressColor = Colors.transparent
      ..indicatorColor = Colors.transparent
      ..textColor = Colors.transparent
      ..textStyle =
          CustomTexts.bodyStyle.copyWith(color: CustomColors.backgroundColor)
      ..boxShadow = [
        const BoxShadow(
          color: CustomColors.backgroundColorDark,
          offset: Offset(0, 2),
          blurRadius: 5,
        ),
      ]
      ..loadingStyle = EasyLoadingStyle.custom
      ..userInteractions = false
      ..dismissOnTap = false
      ..maskType = EasyLoadingMaskType.clear;
    //..successWidget = const LoadingSuccessWidget()
    //..indicatorWidget = const LoadingIndicatorWidget()
    //..infoWidget = const LoadingInfoWidget()
    //..errorWidget = const LoadingErrorWidget();
  }
}
