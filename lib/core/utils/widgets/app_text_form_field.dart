import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class AppTextFormFieldAddressVersionOne extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool isEnabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final bool isAutoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final TextDirection? textDirection;
  final int? maxLength;
  final int? minLines;
  final AutovalidateMode? autovalidateMode;

  const AppTextFormFieldAddressVersionOne({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.isEnabled = true,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.onEditingComplete,
    this.isAutoFocus = false,
    this.inputFormatters,
    this.onChanged,
    this.textDirection,
    this.maxLength,
    this.minLines,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: textDirection ?? TextDirection.ltr,
      controller: controller,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      autofocus: isAutoFocus,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      enabled: isEnabled,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14primaryTextMedium,
      validator: (value) {
        return validator(value);
      },
      minLines: minLines,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      // Decortation
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyles.font18BlackRegular,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14GrayRegular,
        isDense: true,
        errorStyle: const TextStyle(color: Colors.red),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.secondary,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.secondary,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        suffixIcon: suffixIcon,
        // ============= Background Color ================
        fillColor: backgroundColor ?? ColorsManager.lightGray,
        filled: true,
        alignLabelWithHint: true,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        // disabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: ColorsManager.primary,
        //     width: 1.3,
        //   ),
        //   borderRadius: BorderRadius.circular(12.0),
        // ),
      ),
    );
  }
}
