import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'image_widget.dart';
import 'text_widget.dart';

class ListTileWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String? subtitle;
  final String? trailingUrl;
  final Color? textButtonColor;
  final bool arrowIcon;
  final Widget? trailing;

  const ListTileWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.trailingUrl,
    this.textButtonColor,
    this.arrowIcon = false,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        splashColor: Colors.transparent,
        onTap: onTap,
        trailing: trailing??ImageWidget(
          imageUrl: trailingUrl??'',
          width: 24.w,
          height: 24.h,
          color: textButtonColor??AppColors.white,
        ),
        minLeadingWidth: 0,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        title: TextWidget(
          title: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: textButtonColor,
          titleAlign: TextAlign.end,
          maxLines: 2,
        ),
        subtitle: subtitle == null
            ? null
            : TextWidget(
          title: subtitle ?? "",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: textButtonColor,
          titleAlign: TextAlign.start,
        ),
        leading: arrowIcon
            ? Icon(
          Icons.arrow_forward_ios,
          color: AppColors.white,
          size: 24.sp,
        )
            : null);
  }
}