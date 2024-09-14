import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final Color? color;
  final TextAlign? titleAlign;
  final double? fontSize;
  final TextDecoration? decoration;
  final int? maxLines;
  final bool underLine;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? height;

  const TextWidget({
    super.key,
    required this.title,
    this.color,
    this.titleAlign,
    this.underLine = false,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.overflow,
    this.decoration,
    this.fontFamily,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        decorationColor: AppColors.secondaryColor,
        decoration: underLine==true?TextDecoration.underline:decoration ?? TextDecoration.none,
        decorationThickness: 8.sp,
        color: color ?? AppColors.white,
        fontFamily: fontFamily,
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        height: height,
      ),
      maxLines: maxLines ?? 2,
      textAlign: titleAlign ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
