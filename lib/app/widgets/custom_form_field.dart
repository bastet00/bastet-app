import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? header;
  final double? width;
  final double? height;
  final bool? obscure;
  final String? labelText;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Widget? prefixIconWidget;
  final Color? labelColor;
  final Function(String)? onChange;
  final Function()? iconPressed;
  final GestureTapCallback? onPressed;
  final Function(String)? onFieldSubmitted;
  final bool? enabled;
  final bool? filled;
  final TextAlign? align;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final Color? color;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadiusGeometry? borderRadius;
  final double? borderRadiusValue;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disableBorder;
  final String? fontFamily;
  final Color? hintColor;
  final Color? suffixIconColor;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  final int maxValueLength;
  final int minValueLength;
  final AutovalidateMode? autovalidateMode;

  const CustomFormField({
    super.key,
    this.controller,
    this.hint = "",
    this.width,
    this.height,
    this.obscure = false,
    this.header,
    this.labelText,
    this.suffixIcon,
    this.suffixIconWidget,
    this.enabled = true,
    this.labelColor,
    this.onPressed,
    this.align,
    this.prefixIcon,
    this.prefixIconWidget,
    this.focusNode,
    this.maxLines,
    this.minLines,
    this.iconPressed,
    this.color,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.contentPadding,
    this.borderRadius,
    this.borderRadiusValue,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disableBorder,
    this.filled = true,
    this.fillColor,
    this.prefixIconColor,
    this.onFieldSubmitted,
    this.fontFamily,
    this.hintColor,
    this.suffixIconColor,
    this.inputFormatters,
    this.borderColor,
    this.maxValueLength = 255,
    this.minValueLength = 1,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header == null
            ? const SizedBox()
            : Text(
                header ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
        SizedBox(
          height: header == null ? 0 : 10.h,
        ),
        SizedBox(
          height: height,
          width: width,
          child: InkWell(
            onTap: onPressed,
            child: TextFormField(
              cursorColor: AppColors.primaryColor,
              inputFormatters: inputFormatters,
              onFieldSubmitted: onFieldSubmitted ?? (st) {},
              validator: validator ?? (value) {
                if (value!.isEmpty) {
                  return AppStrings.requiredField.tr();
                }
                if (value.length > maxValueLength) {
                  return keyboardType == TextInputType.phone || keyboardType == TextInputType.number
                      ? '${AppStrings.mustLessThan.tr()} $maxValueLength ${AppStrings.digits.tr()}'
                      : '${AppStrings.mustLessThan.tr()} $maxValueLength ${AppStrings.characters.tr()}';
                }
                if (value.length < minValueLength) {
                  return keyboardType == TextInputType.phone || keyboardType == TextInputType.number
                      ? '${AppStrings.mustMoreThan.tr()} $minValueLength ${AppStrings.digits.tr()}'
                      : '${AppStrings.mustMoreThan.tr()} $minValueLength ${AppStrings.characters.tr()}';
                }
                return null;
              },
              textInputAction: textInputAction,
              controller: controller,
              minLines: minLines ?? 1,
              maxLines: maxLines ?? 1,
              enabled: enabled,
              keyboardType: keyboardType,
              focusNode: focusNode,
              onChanged: onChange,
              obscureText: obscure ?? false,
              obscuringCharacter: '*',
              autovalidateMode: autovalidateMode??AutovalidateMode.onUserInteraction,
              textAlign: align ?? TextAlign.start,
              style: TextStyle(
                height: 1.2.h,
                fontFamily: fontFamily,
                color: AppColors.white,
                fontSize: 16.sp,
              ),
              cursorHeight: 16.h,
              decoration: InputDecoration(
                fillColor: fillColor ?? Colors.white,
                filled: filled ?? false,
                isDense: true,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                errorStyle: TextStyle(
                  fontSize: 14.sp,
                  height: 2.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue ?? 15),
                  borderSide: BorderSide(
                    color: borderColor?? AppColors.primaryColor,
                  ),
                ),
                enabledBorder: enabledBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(borderRadiusValue ?? 15),
                      borderSide: BorderSide(
                        color: borderColor?? AppColors.primaryColor,
                      ),
                    ),
                disabledBorder: disableBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(borderRadiusValue ?? 15),
                      borderSide: BorderSide(
                          color: borderColor?? AppColors.primaryColor
                      ),
                    ),
                errorBorder: errorBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(borderRadiusValue ?? 15),
                      borderSide: const BorderSide(color: AppColors.red),
                    ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: focusedBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(borderRadiusValue ?? 15),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                hintText: hint ?? "",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: hintColor ?? AppColors.hint,
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: fontFamily,
                ),
                suffixIcon: suffixIconWidget == null
                    ? (suffixIcon == null
                        ? null
                        : InkWell(
                            onTap: iconPressed ?? () {},
                            child: Icon(
                              suffixIcon,
                              size: 23,
                              color: suffixIconColor ?? AppColors.primaryColor,
                            )))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          suffixIconWidget!,
                        ],
                      ),
                prefixIcon: prefixIconWidget == null
                    ? (prefixIcon == null
                        ? null
                        : Icon(
                            prefixIcon,
                            size: 23.sp,
                            color: prefixIconColor ?? AppColors.primaryColor,
                          ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          prefixIconWidget!,
                          SizedBox(
                            width: 16.h,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
