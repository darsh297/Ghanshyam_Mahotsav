import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFields extends StatelessWidget {
  CustomTextFields({
    super.key,
    this.textFieldName = '',
    this.hintText = '',
    this.trailingIcon,
    this.leadingIcon,
    this.filled = false,
    this.fromLogin = false,
    this.inputBorder,
    this.validator,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.onChange,
    this.maxLength,
    this.minLine,
    this.onSubmitted,
    this.maxLine,
    required this.textFieldController,
  });

  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final String textFieldName;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final AppTextStyle appTextStyle = AppTextStyle();
  final bool filled;
  final bool fromLogin;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final Function(String)? onSubmitted;
  final TextEditingController textFieldController;
  final Function(String)? onChange;

  ///validation
  final String? Function(String?)? validator;

  final InputBorder? inputBorder;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textFieldName != '')
          Column(
            children: [
              Text(
                fromLogin ? textFieldName : textFieldName.tr,
                style: appTextStyle.montserrat14W600,
              ),
              const SizedBox(height: 6)
            ],
          ),
        TextFormField(
          textInputAction: textInputAction,
          maxLines: maxLine,
          minLines: minLine,
          maxLength: maxLength,
          validator: validator,
          keyboardType: textInputType,
          controller: textFieldController,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            border: inputBorder,
            filled: filled,
            fillColor: AppColors.lightGrey,
            hintText: hintText.tr,
            suffixIcon: trailingIcon,
            prefixIcon: leadingIcon,
          ),
          onChanged: onChange,
        )
      ],
    );
  }
}
