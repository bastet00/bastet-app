import 'package:bastet_app/app/utils/helper.dart';
import 'package:bastet_app/features/translation_feature/data/model/literal_translation.dart';
import 'package:bastet_app/features/translation_feature/data/model/translation_details_model.dart';
import 'package:bastet_app/features/translation_feature/presentation/screens/translation_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../fav_feature/presentation/widgets/fav_widget.dart';
import '../../data/model/translation.dart';
import 'details_column_widget.dart';

class LiteralTranslationWidget extends StatelessWidget {
  final LiteralTranslationModel? literalTranslation;


  const LiteralTranslationWidget({
    super.key,
    this.literalTranslation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.colorA69670),
      ),
      child: Row(
        children: [
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
                  title: literalTranslation?.literalTranslation ?? '',
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
              Clipboard.setData(ClipboardData(text: literalTranslation?.literalTranslation ?? ''));
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
    );
  }
}