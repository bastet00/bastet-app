import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/translation_cubit/translation_cubit.dart';
import '../widgets/translation_widget.dart';
import '../widgets/literal_translation_widget.dart';
import '../widgets/suggest_word_widget.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({super.key});

  String _getLanguageText(BuildContext context, bool fromArabic) {
    if (context.locale.languageCode == 'en') {
      return fromArabic
          ? AppStrings.translationEnglish.tr()
          : AppStrings.hieroglyphic.tr();
    } else {
      return fromArabic
          ? AppStrings.translationArabic.tr()
          : AppStrings.hieroglyphic.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          20.verticalSpace,
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
              final cubit = TranslationCubit.get();
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: TextWidget(
                        title: _getLanguageText(context, cubit.fromArabic),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: cubit.convertLanguage,
                      icon: ImageWidget(
                        imageUrl: AppAssets.convert,
                        width: 28.w,
                        height: 28.h,
                        color: AppColors.iconsColor,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 80.w,
                      child: TextWidget(
                        title: _getLanguageText(context, !cubit.fromArabic),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          12.verticalSpace,
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Column(
                  children: [
                    CustomFormField(
                      controller: TranslationCubit.get().translationController,
                      hint: AppStrings.writeHere.tr(),
                      minLines: 5,
                      maxLines: 5,
                      onChange: (text) {
                        if (text.trim().isNotEmpty) {
                          TranslationCubit.get().onTextChanged(text);
                        }
                      },
                    ),
                    Row(
                      children: List.generate(3, (index) {
                        final suggestions =
                            TranslationCubit.get().getSuggestions();
                        return Row(
                          children: [
                            CustomTextButton(
                              color: AppColors.suggestionsBorderColor,
                              titleColor: AppColors.suggestionsTextColor,
                              title: suggestions[index],
                              outlined: true,
                              onPressed: () => TranslationCubit.get()
                                  .handleSuggestion(suggestions[index]),
                            ),
                            6.horizontalSpace,
                          ],
                        );
                      }),
                    ),
                    6.verticalSpace,
                    Row(
                      children: List.generate(2, (index) {
                        final suggestions =
                            TranslationCubit.get().getSuggestions();
                        return Row(
                          children: [
                            CustomTextButton(
                              color: AppColors.suggestionsBorderColor,
                              titleColor: AppColors.suggestionsTextColor,
                              title: suggestions[index + 3],
                              outlined: true,
                              onPressed: () => TranslationCubit.get()
                                  .handleSuggestion(suggestions[index + 3]),
                            ),
                            6.horizontalSpace,
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          ),
          20.verticalSpace,
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
              return TranslationCubit.get().translationController.text.isEmpty
                  ? const SizedBox()
                  : Column(children: [
                      TranslationCubit.get().literalTranslationModel == null
                          ? const SizedBox()
                          : LiteralTranslationWidget(
                              literalTranslation: TranslationCubit.get()
                                  .literalTranslationModel,
                            ),
                      20.verticalSpace,
                      state is TranslationLoading
                          ? const Loading()
                          : TranslationCubit.get()
                                      .translationModel
                                      ?.translation
                                      ?.isEmpty ??
                                  false
                              ? const SuggestWordWidget()
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return TranslationWidget(
                                      translation: TranslationCubit.get()
                                          .translationModel
                                          ?.translation?[index],
                                    );
                                  },
                                  itemCount: TranslationCubit.get()
                                          .translationModel
                                          ?.translation
                                          ?.length ??
                                      0,
                                  separatorBuilder: (context, index) =>
                                      20.verticalSpace,
                                  shrinkWrap: true,
                                  primary: false,
                                )
                    ]);
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
