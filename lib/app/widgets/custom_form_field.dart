import 'package:easy_localization/easy_localization.dart' as easy_loc;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomFormField extends StatefulWidget {

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
  final Color? textColor;
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
    this.textColor,
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
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  TextDirection _textDirection = TextDirection.rtl;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_updateTextDirection);
  }

  void _updateTextDirection() {
    if (widget.controller?.text.isNotEmpty?? false) {
      final firstChar = widget.controller?.text.characters.first;

      // Check if the first character is an Arabic letter
      if (RegExp(r'^[\u0600-\u06FF]').hasMatch(firstChar!)) {
        setState(() {
          _textDirection = TextDirection.rtl;
        });
      } else {
        setState(() {
          _textDirection = TextDirection.ltr;
        });
      }
    } else {
      // Default to LTR if the text is empty
      setState(() {
        _textDirection = TextDirection.rtl;
      });
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_updateTextDirection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.header == null
            ? const SizedBox()
            : Text(
                widget.header ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
        SizedBox(
          height: widget.header == null ? 0 : 10.h,
        ),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: InkWell(
            onTap: widget.onPressed,
            child: TextFormField(
              textDirection: _textDirection,
              cursorColor: AppColors.primaryColor,
              inputFormatters: widget.inputFormatters,
              onFieldSubmitted: widget.onFieldSubmitted ?? (st) {},
              validator: widget.validator ?? (value) {
                if (value!.isEmpty) {
                  return AppStrings.requiredField.tr();
                }
                if (value.length > widget.maxValueLength) {
                  return widget.keyboardType == TextInputType.phone || widget.keyboardType == TextInputType.number
                      ? '${AppStrings.mustLessThan.tr()} ${widget.maxValueLength} ${AppStrings.digits.tr()}'
                      : '${AppStrings.mustLessThan.tr()} ${widget.maxValueLength} ${AppStrings.characters.tr()}';
                }
                if (value.length < widget.minValueLength) {
                  return widget.keyboardType == TextInputType.phone || widget.keyboardType == TextInputType.number
                      ? '${AppStrings.mustMoreThan.tr()} ${widget.minValueLength} ${AppStrings.digits.tr()}'
                      : '${AppStrings.mustMoreThan.tr()} ${widget.minValueLength} ${AppStrings.characters.tr()}';
                }
                return null;
              },
              textInputAction: widget.textInputAction,
              controller: widget.controller,
              minLines: widget.minLines ?? 1,
              maxLines: widget.maxLines ?? 1,
              enabled: widget.enabled,
              keyboardType: widget.keyboardType,
              focusNode: widget.focusNode,
              onChanged: widget.onChange,
              obscureText: widget.obscure ?? false,
              obscuringCharacter: '*',
              autovalidateMode: widget.autovalidateMode??AutovalidateMode.disabled,
              textAlign: widget.align ?? TextAlign.start,
              style: TextStyle(
                height: 1.2.h,
                fontFamily: widget.fontFamily,
                color: widget.textColor?? AppColors.white,
                fontSize: 16.sp,
              ),
              cursorHeight: 16.h,
              decoration: InputDecoration(
                fillColor: widget.fillColor ?? AppColors.containerColor,
                filled: widget.filled ?? false,
                isDense: true,
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                errorStyle: TextStyle(
                  fontSize: 14.sp,
                  height: 2.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? 6.r),
                  borderSide: BorderSide(
                    color: widget.borderColor?? Colors.transparent,
                  ),
                ),
                enabledBorder: widget.enabledBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue ?? 6.r),
                      borderSide: BorderSide(
                        color: widget.borderColor?? Colors.transparent,
                      ),
                    ),
                disabledBorder: widget.disableBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue ?? 6.r),
                      borderSide: BorderSide(
                          color: widget.borderColor?? Colors.transparent,
                      ),
                    ),
                errorBorder: widget.errorBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue ?? 6.r),
                      borderSide: const BorderSide(color: AppColors.red),
                    ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.borderColor?? Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: widget.focusedBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue ?? 6.r),
                      borderSide: BorderSide(
                        color: widget.borderColor?? Colors.transparent,
                      ),
                    ),
                hintText: widget.hint ?? "",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: widget.hintColor ?? AppColors.hint,
                ),
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: widget.fontFamily,
                ),
                suffixIcon: widget.suffixIconWidget == null
                    ? (widget.suffixIcon == null
                        ? null
                        : InkWell(
                            onTap: widget.iconPressed ?? () {},
                            child: Icon(
                              widget.suffixIcon,
                              size: 23,
                              color: widget.suffixIconColor ?? AppColors.primaryColor,
                            )))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.suffixIconWidget!,
                        ],
                      ),
                prefixIcon: widget.prefixIconWidget == null
                    ? (widget.prefixIcon == null
                        ? null
                        : Icon(
                            widget.prefixIcon,
                            size: 23.sp,
                            color: widget.prefixIconColor ?? AppColors.primaryColor,
                          ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.prefixIconWidget!,
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
