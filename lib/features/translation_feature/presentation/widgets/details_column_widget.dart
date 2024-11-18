import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class DetailsColumnWidget extends StatelessWidget {
  final String title;
  final String? description;
  final double? descriptionFontSize;
  final bool isCopy;

  const DetailsColumnWidget({
    super.key,
    required this.title,
    this.description,
    this.descriptionFontSize,
    this.isCopy = false
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
        Row(
          children: [
            TextWidget(
              title: description ?? '',
              fontWeight: FontWeight.w400,
              titleAlign: TextAlign.start,
              maxLines: 10,
              fontSize: descriptionFontSize?? 14.sp,
            ),
            if (isCopy) CustomTextButton(
              onPressed: () {
                // Copy to clipboard
                Fluttertoast.cancel();
                Clipboard.setData(ClipboardData(text: description ?? ''));
                showToast(msg: 'تم النسخ');
              },
              icon: ImageWidget(
                imageUrl: AppAssets.copy,
                width: 15.w,
                height: 15.h,
              ),
            ),
          ],
        ),
        10.verticalSpace,
      ],
    );
  }
}
