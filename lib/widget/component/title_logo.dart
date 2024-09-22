import 'package:flutter/material.dart';
import 'package:recruitfrontend/constant/const_info.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:recruitfrontend/gen/assets.gen.dart';

class TitleLogo extends StatelessWidget {
  final double width;
  final double height;
  final double logoHeight;
  final double logoWidth;

  const TitleLogo({
    super.key,
    this.width = 200,
    this.height = 50,
    this.logoHeight = 32,
    this.logoWidth = 32,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Assets.image.logo.svg(
            width: logoWidth,
            height: logoHeight,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                0,
                4,
                4,
                8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ConstInfo.appName,
                  style: CustomTexts.titleStyle.copyWith(
                    color: CustomColors.textColorRegular,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
