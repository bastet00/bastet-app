import 'package:easy_localization/easy_localization.dart';
import 'package:bastet_app/features/translation_feature/data/model/literal_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/translation_cubit/translation_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.colorA69670),
        ),
        child: BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  CustomTextButton(
                    onPressed: () {
                      setState(() {
                        isFolded = !isFolded;
                      });
                    },
                    title: AppStrings.literalTranslation.tr(),
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
                        title: TranslationCubit.get()
                                .literalTranslationModel
                                ?.literalTranslation ??
                            '',
                        maxLines: 5,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Fluttertoast.cancel();
                      Clipboard.setData(ClipboardData(
                          text: TranslationCubit.get()
                                  .literalTranslationModel
                                  ?.literalTranslation ??
                              ''));
                      showToast(msg: AppStrings.copied.tr());
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
                              if (TranslationCubit.get()
                                      .literalTranslationModel
                                      ?.lettersMapper !=
                                  null)
                                ...?TranslationCubit.get()
                                    .literalTranslationModel
                                    ?.lettersMapper
                                    ?.map((letterMap) => Padding(
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
                                                  letterMap.alphabetLetters ??
                                                      '',
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
                            TextWidget(
                              title: AppStrings.compoundPhoneticSigns.tr(),
                              color: AppColors.suggestionsTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                            const Spacer(),
                            Transform.scale(
                              scale: 0.75,
                              child: Switch(
                                trackOutlineWidth:
                                    const WidgetStatePropertyAll(0),
                                trackOutlineColor: WidgetStateProperty.all(
                                    AppColors.suggestionsTextColor),
                                inactiveThumbColor:
                                    AppColors.inactiveSwitchThumbColor,
                                inactiveTrackColor:
                                    AppColors.suggestionsTextColor,
                                activeColor: AppColors.activeSwitchColor,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: TranslationCubit.get()
                                    .useMultiLetterSymbols,
                                onChanged: (bool value) {
                                  TranslationCubit.get()
                                      .toggleMultiLetterSymbols();
                                },
                              ),
                            )
                          ],
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              TextWidget(
                                title: AppStrings.gender.tr(),
                                color: AppColors.suggestionsTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              CustomTextButton(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 1.w),
                                onPressed: () {
                                  TranslationCubit.get()
                                      .applyGender("MALE");
                                },
                                title: '𓀀',
                                width: 40.w,
                                titleColor: TranslationCubit.get().gender == "MALE"
                                    ? AppColors.primaryColor
                                    : AppColors.white,
                                fontSize: 21.sp,
                              ),
                              const VerticalDivider(
                                color: AppColors.colorC6B283,
                                thickness: 1,
                                width: 6,
                                indent: 10,
                                endIndent: 12
                              ),
                              CustomTextButton(
                                onPressed: () {
                                  TranslationCubit.get()
                                      .applyGender("FEMALE");
                                },
                                title: '𓁐',
                                width: 40.w,
                                fontSize: 21.sp,
                                titleColor: TranslationCubit.get().gender == "FEMALE"
                                    ? AppColors.primaryColor
                                    : AppColors.white,
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 1.w),
                              ),
                            ],
                          )
                        )
                      ],
                    ))
              ]
            ],
          );
        }));
  }
}
