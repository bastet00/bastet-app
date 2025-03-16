import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
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
                        title: cubit.fromArabic ? 'عربي' : 'هيروغليفي',
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
                        title: cubit.fromArabic ? 'هيروغليفي' : 'عربي',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              children: [
                CustomFormField(
                  controller: TranslationCubit.get().translationController,
                  hint: 'اكتب  هنا',
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
                    final title = index == 0
                        ? 'شمس'
                        : index == 1
                            ? 'عدالة'
                            : 'قلب';
                    return Row(
                      children: [
                        CustomTextButton(
                          color: AppColors.suggestionsBorderColor,
                          titleColor: AppColors.suggestionsTextColor,
                          title: title,
                          outlined: true,
                          onPressed: () {
                            TranslationCubit.get().translationController.text =
                                title;
                            TranslationCubit.get().getTranslation();
                            TranslationCubit.get().getLiteralTranslation();
                          },
                        ),
                        6.horizontalSpace,
                      ],
                    );
                  }),
                ),
                6.verticalSpace,
                Row(
                  children: List.generate(2, (index) {
                    final title = index == 0 ? 'صباح الخير' : 'جميل';
                    return Row(
                      children: [
                        CustomTextButton(
                          color: AppColors.suggestionsBorderColor,
                          titleColor: AppColors.suggestionsTextColor,
                          title: title,
                          outlined: true,
                          onPressed: () {
                            TranslationCubit.get().translationController.text =
                                title;
                            TranslationCubit.get().getTranslation();
                            TranslationCubit.get().getLiteralTranslation();
                          },
                        ),
                        6.horizontalSpace,
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
              return TranslationCubit.get().translationController.text.isEmpty
                  ? const SizedBox()
                  : state is TranslationLoading
                      ? const Loading()
                      : TranslationCubit.get()
                                  .translationModel
                                  ?.translation
                                  ?.isEmpty ??
                              false
                          ? Column(
                              children: [
                                LiteralTranslationWidget(
                                  literalTranslation: TranslationCubit.get()
                                      .literalTranslationModel,
                                ),
                                20.verticalSpace,
                                const SuggestWordWidget(),
                              ],
                            )
                          : Column(
                              children: [
                                LiteralTranslationWidget(
                                  literalTranslation: TranslationCubit.get()
                                      .literalTranslationModel,
                                ),
                                20.verticalSpace,
                                ListView.separated(
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
                              ],
                            );
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
