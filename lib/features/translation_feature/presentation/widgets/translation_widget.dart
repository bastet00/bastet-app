import 'package:bastet_app/app/utils/helper.dart';
import 'package:bastet_app/features/translation_feature/data/model/translation_details_model.dart';
import 'package:bastet_app/features/translation_feature/presentation/screens/translation_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class TranslationWidget extends StatelessWidget {
  final Translation? translation;
  final TranslationDetailsModel? translationDetails;
  final bool isDetailsScreen;

  const TranslationWidget({
    super.key,
    this.translation,
    this.translationDetails,
    this.isDetailsScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final egyptianSymbolUnicode  = int.parse(translation?.egyptian?[0].symbol?? '', radix: 16);
    final egyptianWord = translation?.egyptian?[0].word;
    final egyptian = '${translation?.egyptian?[0].word?? ''} ${String.fromCharCode(egyptianSymbolUnicode)}';
    final arabic = translation?.arabic?.map((e) => e.word).join('، ');
    final english = translation?.english?.map((e) => e.word).join(', ');
    final hieroglyphicSigns = translationDetails?.egyptian?[0].hieroglyphicSigns?.map((e) => e).join(' ');
    final hieroglyphics = translationDetails?.egyptian?[0].hieroglyphics?.map((e) => e).join(', ');
    final resources = translationDetails?.resources?.map((e) => '• $e').join('\n');

    return InkWell(
      onTap: () {
        if (!isDetailsScreen && translation?.id != null) navigateTo(TranslationDetailsScreen(translation: translation!));
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.colorA69670),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     // CustomTextButton(
                  //     //   onPressed: () {},
                  //     //   icon: ImageWidget(
                  //     //     imageUrl: AppAssets.audio,
                  //     //     width: 24.w,
                  //     //     height: 20.h,
                  //     //   ),
                  //     // ),
                  //     TextWidget(
                  //       title: TranslationCubit.get().fromArabic ? 'هيروغليفي' : 'عربي',
                  //       fontWeight: FontWeight.w400,
                  //       fontSize: 16.sp,
                  //       color: AppColors.hint,
                  //     ),
                  //   ],
                  // ),
                  20.horizontalSpace,
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      TextWidget(
                        title: egyptianWord?? '',
                        color: Colors.transparent,
                        fontWeight: FontWeight.w700,
                        underLine: true,
                        fontSize: isDetailsScreen ? 22.sp : 18.sp,
                      ),
                      TextWidget(
                        title: egyptian,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: isDetailsScreen ? 22.sp : 18.sp,
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  if (!isDetailsScreen) TextWidget(
                    title: arabic?? '',
                    fontWeight: FontWeight.w400,
                    titleAlign: TextAlign.start,
                    maxLines: 6,
                  ),
                  if (isDetailsScreen) ...[
                    DetailsColumnWidget(
                      title: 'إنجليزي:',
                      description: english,
                    ),
                    DetailsColumnWidget(
                      title: 'عربي:',
                      description: arabic,
                    ),
                    DetailsColumnWidget(
                      title: 'القيمة الصوتية الإنجليزية:',
                      description: translationDetails?.egyptian?[0].transliteration,
                    ),
                    DetailsColumnWidget(
                      title: 'الهيروغليفية:',
                      description: hieroglyphicSigns,
                      descriptionFontSize: 16.sp,
                    ),
                    DetailsColumnWidget(
                      title: 'علامات جاردنير:',
                      description: hieroglyphics,
                    ),
                    DetailsColumnWidget(
                      title: 'المصادر:',
                      description: resources,
                      descriptionFontSize: 12.sp,
                    ),
                  ],
                  20.verticalSpace,
                  const Divider(
                    color: AppColors.color84744F,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
              child: Row(
                children: [
                  if (!isDetailsScreen) CustomTextButton(
                    onPressed: () {
                      if (translation?.id != null) navigateTo(TranslationDetailsScreen(translation: translation!));
                    },
                    title: 'القاموس',
                    titleColor: AppColors.white,
                    icon: ImageWidget(
                      imageUrl: AppAssets.dictionary,
                      width: 16.w,
                      height: 20.h,
                    ),
                  ),
                  const Spacer(),
                  CustomTextButton(
                    onPressed: () {
                      // Copy to clipboard
                      Clipboard.setData(ClipboardData(text: egyptian));
                      showToast(msg: 'تم النسخ');
                    },
                    icon: ImageWidget(
                      imageUrl: AppAssets.copy,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  VerticalDivider(
                    width: 8.w,
                    color: AppColors.colorC7B384,
                    indent: 10.h,
                    endIndent: 10.h,
                  ),
                  FavWidget(
                    translation: translation!,
                  ),
                  VerticalDivider(
                    width: 8.w,
                    color: AppColors.colorC7B384,
                    indent: 10.h,
                    endIndent: 10.h,
                  ),
                  CustomTextButton(
                    onPressed: () async {
                      final id = translation?.id;
                      final String appLink = 'bastet-app.com/word/$id';
                      Clipboard.setData(ClipboardData(text: appLink));
                      Share.share(appLink);
                    },
                    icon: ImageWidget(
                      imageUrl: AppAssets.share,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}