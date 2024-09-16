import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'text_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.title,
    this.color,
    this.titleColor,
    this.fontSize,
    this.fontWeight,
    this.onPressed,
    this.textDecoration,
    this.padding,
    this.icon,
    this.loading = false,
    this.outlined = false,
    this.width,
  });

  final String? title;
  final Color? color;
  final Color? titleColor;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final FontWeight? fontWeight;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool loading;
  final bool outlined;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(
              color: color ?? AppColors.primaryColor,
            ),
          )
        : SizedBox(
            width: width,
            height: 48.h,
            child: TextButton(
                style: TextButton.styleFrom(
                  padding: padding ??
                      EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                  foregroundColor: color ?? AppColors.primaryColor,
                  side: outlined
                      ? BorderSide(color: color ?? AppColors.primaryColor)
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                onPressed: onPressed ?? () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      icon ??
                          Icon(
                            Icons.arrow_forward_ios,
                            color: color ?? AppColors.primaryColor,
                            size: 18.sp,
                          ),
                      if (title != null) 8.horizontalSpace,
                    ],
                    TextWidget(
                      title: title ?? "",
                      decoration: textDecoration,
                      color: titleColor ?? AppColors.primaryColor,
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: fontWeight ?? FontWeight.w400,
                    ),
                  ],
                )),
          );
  }
}
