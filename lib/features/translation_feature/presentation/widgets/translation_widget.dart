import 'package:bastet_app/app/utils/helper.dart';
import 'package:bastet_app/features/translation_feature/data/model/translation_details_model.dart';
import 'package:bastet_app/features/translation_feature/presentation/screens/translation_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
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
    final egyptianArabicWord = translation?.egyptian?[0].word ?? '';
    final egyptianEnglishWord = translation?.egyptian?[0].transliteration ?? '';
    final arabic = translation?.arabic?.map((e) => e.word).join('، ');
    final english = translation?.english?.map((e) => e.word).join(', ');
    final hieroglyphicSigns =
        translation?.egyptian?[0].hieroglyphicSigns?.join(' ');
    final hieroglyphics = translation?.egyptian?[0].hieroglyphics?.join(', ');
    final resources =
        translationDetails?.resources?.map((e) => '• $e').join('\n');
    final englishTransliteration =
        translationDetails?.egyptian?[0].transliteration ?? '';

    return InkWell(
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
                  20.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      if (!isDetailsScreen && translation?.id != null)
                        navigateTo(TranslationDetailsScreen(
                            translation: translation!));
                    },
                    child: Stack(
                      alignment: context.locale.languageCode == "en"
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      children: [
                        TextWidget(
                          title: context.locale.languageCode == "en"
                              ? egyptianEnglishWord
                              : egyptianArabicWord,
                          color: Colors.transparent,
                          fontWeight: FontWeight.w700,
                          underLine: true,
                          fontSize: isDetailsScreen ? 22.sp : 18.sp,
                        ),
                        TextWidget(
                          title: context.locale.languageCode == "en"
                              ? egyptianEnglishWord
                              : egyptianArabicWord,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: isDetailsScreen ? 22.sp : 18.sp,
                        ),
                      ],
                    ),
                  ),
                  if (!isDetailsScreen &&
                      (hieroglyphicSigns?.isNotEmpty ?? false))
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 235.w),
                          child: TextWidget(
                            title: hieroglyphicSigns ?? '',
                            fontWeight: FontWeight.w400,
                            titleAlign: TextAlign.start,
                            color: AppColors.primaryColor,
                            maxLines: 6,
                          ),
                        ),
                        4.horizontalSpace,
                        CustomTextButton(
                          onPressed: () {
                            // Copy to clipboard
                            Fluttertoast.cancel();
                            Clipboard.setData(
                                ClipboardData(text: hieroglyphicSigns ?? ''));
                            showToast(msg: AppStrings.copied.tr());
                          },
                          icon: ImageWidget(
                            imageUrl: AppAssets.copy,
                            width: 15.w,
                            height: 15.h,
                            color: AppColors.colorA69670,
                          ),
                        ),
                      ],
                    ),
                  if (!isDetailsScreen)
                    TextWidget(
                      title: (context.locale.languageCode == "en"
                              ? english
                              : arabic) ??
                          '',
                      fontWeight: FontWeight.w400,
                      titleAlign: TextAlign.start,
                      maxLines: 6,
                    ),
                  if (isDetailsScreen) ...[
                    DetailsColumnWidget(
                      title: AppStrings.englishLabel.tr(),
                      description: english,
                    ),
                    DetailsColumnWidget(
                      title: AppStrings.arabicLabel.tr(),
                      description: arabic,
                    ),
                    DetailsColumnWidget(
                      title: AppStrings.englishPhonetic.tr(),
                      description: englishTransliteration,
                      isCopy: true,
                    ),
                    DetailsColumnWidget(
                      title: AppStrings.hieroglyphicsLabel.tr(),
                      description: hieroglyphicSigns,
                      descriptionFontSize: 16.sp,
                      isCopy: true,
                    ),
                    DetailsColumnWidget(
                      title: AppStrings.gardinerSigns.tr(),
                      description: hieroglyphics,
                      isCopy: true,
                    ),
                    DetailsColumnWidget(
                      title: AppStrings.sources.tr(),
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
                  if (!isDetailsScreen)
                    CustomTextButton(
                      onPressed: () {
                        if (translation?.id != null)
                          navigateTo(TranslationDetailsScreen(
                              translation: translation!));
                      },
                      title: AppStrings.details.tr(),
                      titleColor: AppColors.white,
                      icon: ImageWidget(
                        imageUrl: AppAssets.detail,
                        width: 16.w,
                        height: 20.h,
                      ),
                    ),
                  const Spacer(),
                  CustomTextButton(
                    onPressed: () {
                      Fluttertoast.cancel();
                      Clipboard.setData(ClipboardData(
                          text: context.locale.languageCode == "en"
                              ? egyptianEnglishWord
                              : egyptianArabicWord));
                      showToast(msg: AppStrings.copied.tr());
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
