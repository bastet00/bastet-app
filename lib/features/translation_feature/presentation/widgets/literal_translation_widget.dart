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

class _LiteralTranslationWidget extends State<LiteralTranslationWidget> {
  bool isFolded = true;
  bool useMultiLetterSymbols = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
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
                  title: 'ترجمة حرفية',
                  titleColor: AppColors.suggestionsTextColor,
                  fontWeight: FontWeight.w400,
                  icon: ImageWidget(
                    imageUrl: isFolded
                        ? AppAssets.foldedArrow
                        : AppAssets.unfoldedArrow,
                    width: 25.w,
                    height: 25.h,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                      title:
                          widget.literalTranslation?.literalTranslation ?? '',
                      maxLines: 5,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    Fluttertoast.cancel();
                    // Copy to clipboard
                    Clipboard.setData(ClipboardData(
                        text: widget.literalTranslation?.literalTranslation ??
                            ''));
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
            if (!isFolded) ...[
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.w),
                  child: Column(
                    children: [
                      const Divider(
                        color: AppColors.color84744F,
                      ),
                      SingleChildScrollView(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            if (widget.literalTranslation?.lettersMapper !=
                                null)
                              ...?widget.literalTranslation!.lettersMapper?.map(
                                  (letterMap) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Column(
                                        children: [
                                          TextWidget(
                                            title:
                                                letterMap.hieroglyphics ?? '',
                                            fontWeight: FontWeight.w400,
                                            titleAlign: TextAlign.start,
                                          ),
                                          10.verticalSpace,
                                          TextWidget(
                                            title:
                                                letterMap.alphabetLetters ?? '',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      )))
                          ])),
                      const Divider(
                        color: AppColors.color84744F,
                      ),
                      Row(
                        children: [
                          const TextWidget(
                            title: 'علامات صوتية مركبة: ',
                            color: AppColors.suggestionsTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.75,
                            child: Switch(
                              trackOutlineWidth: const WidgetStatePropertyAll(0),
                              trackOutlineColor: WidgetStateProperty.all(
                                  AppColors.suggestionsTextColor),
                              inactiveThumbColor: AppColors.inactiveSwitchThumbColor,
                              inactiveTrackColor: AppColors.suggestionsTextColor,
                              activeColor: AppColors.primaryColor,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              value: useMultiLetterSymbols,
                              onChanged: (bool value) {
                                setState(() {
                                  useMultiLetterSymbols =
                                      !useMultiLetterSymbols;
                                });
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ]
          ],
        ));
  }
}
