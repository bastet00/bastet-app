import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/text_widget.dart';

class DetailsColumnWidget extends StatelessWidget {
  final String title;
  final String? description;
  final double? descriptionFontSize;

  const DetailsColumnWidget({
    super.key,
    required this.title,
    this.description,
    this.descriptionFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title: title,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
          fontSize: 14.sp,
        ),
        TextWidget(
          title: description ?? '',
          fontWeight: FontWeight.w400,
          titleAlign: TextAlign.start,
          maxLines: 10,
          fontSize: descriptionFontSize?? 14.sp,
        ),
        10.verticalSpace,
      ],
    );
  }
}
