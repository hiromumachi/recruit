import 'package:flutter/material.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';
import 'package:recruitfrontend/gen/assets.gen.dart';
import 'package:recruitfrontend/model/enum/button_status.dart';

class AddButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const AddButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  AddButtonState createState() => AddButtonState();
}

class AddButtonState extends State<AddButton> {
  ButtonStatus _status = ButtonStatus.normal;
  Color textColor = CustomColors.mainColor;

  // 背景色と文字色を状態に基づいて取得
  Color getBackgroundColor() {
    switch (_status) {
      case ButtonStatus.hover:
        return CustomColors.whiteHoverColor;
      case ButtonStatus.pressed:
        return CustomColors.whitePressedColor;
      case ButtonStatus.disabled:
        return CustomColors.whiteDisabledColor;
      default:
        return CustomColors.backgroundColor;
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
            border: Border.all(
              color: CustomColors.mainColor,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Assets.image.plus.svg(
                  colorFilter: ColorFilter.mode(
                    textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'New Page',
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
