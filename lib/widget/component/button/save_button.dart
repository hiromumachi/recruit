import 'package:flutter/material.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:recruitfrontend/gen/assets.gen.dart';
import 'package:recruitfrontend/model/enum/button_status.dart';

class SaveButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const SaveButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  SaveButtonState createState() => SaveButtonState();
}

class SaveButtonState extends State<SaveButton> {
  ButtonStatus _status = ButtonStatus.normal;
  Color textColor = CustomColors.backgroundColor;

  // 背景色と文字色を状態に基づいて取得
  Color getBackgroundColor() {
    switch (_status) {
      case ButtonStatus.hover:
        return CustomColors.blueHoverColor;
      case ButtonStatus.pressed:
        return CustomColors.bluePressedColor;
      case ButtonStatus.disabled:
        return CustomColors.blueDisabledColor;
      default:
        return CustomColors.mainColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (_status != ButtonStatus.pressed) {
          setState(() {
            _status = ButtonStatus.hover;
          });
        }
      },
      onExit: (_) {
        if (_status != ButtonStatus.pressed) {
          setState(() {
            _status = ButtonStatus.normal;
          });
        }
      },
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _status = ButtonStatus.pressed;
          });
        },
        onTapUp: (_) {
          setState(() {
            _status = ButtonStatus.normal;
          });
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        onTapCancel: () {
          setState(() {
            _status = ButtonStatus.normal;
          });
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: getBackgroundColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Assets.image.save.svg(
                  colorFilter: ColorFilter.mode(
                    textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Save',
                  style: CustomTexts.minimumStyle.copyWith(
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
