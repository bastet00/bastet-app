import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'image_widget.dart';
import 'text_widget.dart';

class ListTileWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String? subtitle;
  final String? leadingUrl;
  final Color? textButtonColor;
  final bool arrowIcon;
  final Widget? leading;

  const ListTileWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.leadingUrl,
    this.textButtonColor,
    this.arrowIcon = false,
    this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        splashColor: Colors.transparent,
        onTap: onTap,
        leading: leading??ImageWidget(
          imageUrl: leadingUrl??'',
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
          titleAlign: TextAlign.start,
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
        trailing: arrowIcon
            ? Icon(
          Icons.arrow_forward_ios,
          color: AppColors.white,
          size: 24.sp,
        )
            : null);
  }
}