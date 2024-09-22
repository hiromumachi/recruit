import 'package:flutter/material.dart';
import 'package:recruitfrontend/constant/custom_colors.dart';
import 'package:recruitfrontend/constant/custom_texts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final bool isTitle;
  final ValueChanged<String> onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.isTitle,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly,
      maxLines: null,
      expands: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: readOnly ? Colors.transparent : Colors.white,
        border: InputBorder.none,
        enabledBorder: readOnly
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.mainColor),
                borderRadius: BorderRadius.circular(8),
              ),
        focusedBorder: readOnly
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.mainColor),
                borderRadius: BorderRadius.circular(8),
              ),
      ),
      style: readOnly && isTitle
          ? CustomTexts.titleStyle
              .copyWith(color: CustomColors.textColorRegular)
          : CustomTexts.bodyStyle
              .copyWith(color: CustomColors.textColorRegular),
      textAlignVertical: TextAlignVertical.top,
    );
  }
}
