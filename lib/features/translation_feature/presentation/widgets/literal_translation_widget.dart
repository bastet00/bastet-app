import 'package:bastet_app/app/utils/helper.dart';
import 'package:bastet_app/features/fav_feature/presentation/widgets/fold_arrow.dart';
import 'package:bastet_app/features/translation_feature/data/model/literal_translation.dart';
import 'package:bastet_app/features/translation_feature/data/model/translation_details_model.dart';
import 'package:bastet_app/features/translation_feature/presentation/screens/translation_details_screen.dart';
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

class LiteralTranslationWidget extends StatefulWidget {
  final LiteralTranslationModel? literalTranslation;


  const LiteralTranslationWidget({
    super.key,
    this.literalTranslation,
  });


  @override
  State<LiteralTranslationWidget> createState() => _LiteralTranslationWidget();
}
class _LiteralTranslationWidget extends State<LiteralTranslationWidget>{
  bool isFolded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
        vertical: 1.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.colorA69670),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomTextButton(
                onPressed: () {
                  setState(() {
                    isFolded = !isFolded;
                  });
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: ImageWidget(
                    imageUrl: isFolded ? AppAssets.foldedArrow : AppAssets.unfoldedArrow,
                    width: 25.w,
                    height: 25.h,
                  ),
                ),
              ),
              10.horizontalSpace,
              const Align(
                alignment: Alignment.centerRight,
                child: TextWidget(
                  title: "ترجمة حرفية",
                  maxLines: 5,
                  color: AppColors.suggestionsTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    title: widget.literalTranslation?.literalTranslation ?? '',
                    maxLines: 5,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              20.horizontalSpace,
              CustomTextButton(
                onPressed: () {
                  Fluttertoast.cancel();
                  // Copy to clipboard
                  Clipboard.setData(ClipboardData(text: widget.literalTranslation?.literalTranslation ?? ''));
                  showToast(msg: 'تم النسخ');
                },
                icon: ImageWidget(
                  imageUrl: AppAssets.copy,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ],
          ),
          if (!isFolded) ...[
            Row(
              children: [
                TextWidget(
                  title: widget.literalTranslation?.literalTranslation ?? '',
                  fontWeight: FontWeight.w400,
                  titleAlign: TextAlign.start,
                  maxLines: 10,
                  fontSize: 14.sp,
                ),
              ],
            )

        ]
        ],
      )
    );
  }

}