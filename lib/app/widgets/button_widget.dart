import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/ui_helpers.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.borderRadius,
    this.borderRadiusObject,
    this.textSize = 18,
    this.text,
    this.icon,
    this.color,
    this.border,
    this.onPressed,
    this.width = double.infinity,
    this.height,
    this.decoration,
    this.textColor,
    this.loading = false,
    this.child,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.outlined = false,
    this.align,
    this.fontFamily,
    this.leadingIcon = false,
  });

  final String? text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final double? textSize;
  final BoxDecoration? decoration;
  final Color? textColor;
  final bool loading;
  final Color? color;
  final Border? border;
  final TextAlign? align;
  final Widget? icon;
  final double? borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final BorderRadius? borderRadiusObject;
  final Widget? child;
  final bool outlined;
  final String? fontFamily;
  final bool leadingIcon;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ))
        : InkWell(
            onTap: () {
              UIHelpers.removeKeyboard();
              if (onPressed != null) {
                onPressed!();
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              width: width,
              height: height ?? 53.h,
              decoration: decoration ??
                  BoxDecoration(
                    borderRadius: borderRadiusObject ??
                        BorderRadius.circular(borderRadius ?? 40),
                    gradient: const LinearGradient(
                      begin: Alignment(1, 0),
                      end: Alignment(-1, 0),
                      colors: [AppColors.buttonGradient1, AppColors.buttonGradient2],
                    ),
                  ),
              child: child ??
                  (leadingIcon
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Text(
                              text ?? "",
                              textAlign: align,
                              style: TextStyle(
                                color: outlined
                                    ? textColor ?? AppColors.primaryColor
                                    : textColor ?? AppColors.white,
                                fontSize: textSize ?? 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: fontFamily,
                              ),
                            ),
                            const Spacer(),
                            icon ?? const SizedBox(),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon ?? const SizedBox(),
                            if (icon != null && (text?.isNotEmpty ?? false))
                              const SizedBox(
                                width: 8,
                              )
                            else
                              Container(),
                            Text(
                              text ?? "",
                              textAlign: align,
                              style: TextStyle(
                                color: outlined
                                    ? textColor ?? AppColors.primaryColor
                                    : textColor ?? AppColors.white,
                                fontSize: textSize ?? 18.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: fontFamily,
                              ),
                            ),
                          ],
                        )),
            ),
          );
  }
}
