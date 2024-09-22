import 'package:flutter/material.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/gen/assets.gen.dart';
import 'package:recruitfrontend/model/enum/button_status.dart';

class DeleteButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const DeleteButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  DeleteButtonState createState() => DeleteButtonState();
}

class DeleteButtonState extends State<DeleteButton> {
  ButtonStatus _status = ButtonStatus.normal;

  // 背景色と文字色を状態に基づいて取得
  Color? getBackgroundColor() {
    switch (_status) {
      case ButtonStatus.hover:
        return CustomColors.whiteHoverColor;
      case ButtonStatus.pressed:
        return CustomColors.whitePressedColor;
      case ButtonStatus.disabled:
        return CustomColors.whiteDisabledColor;
      default:
        return null;
    }
  }

  Color getTextColor() {
    switch (_status) {
      case ButtonStatus.hover:
        return CustomColors.grayHoverColor;
      case ButtonStatus.pressed:
        return CustomColors.grayPressedColor;
      case ButtonStatus.disabled:
        return CustomColors.whiteDisabledColor;
      default:
        return CustomColors.buttonColorNormal;
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
          ),
          child: Assets.image.delete.svg(
            colorFilter: ColorFilter.mode(
              getTextColor(),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
