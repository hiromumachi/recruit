import 'package:flutter/material.dart';
import 'package:recruitfrontend/constant/const_info.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:recruitfrontend/model/extension/context_extension.dart';

class BottomArea extends StatelessWidget {
  const BottomArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      height: context.screen.height * 0.15,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ConstInfo.copyRight,
              style: CustomTexts.captionStyle.copyWith(
                color: CustomColors.textColorRegular,
              ),
            ),
            Text(
              ConstInfo.companyName,
              style: CustomTexts.captionStyle.copyWith(
                color: CustomColors.textColorRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
