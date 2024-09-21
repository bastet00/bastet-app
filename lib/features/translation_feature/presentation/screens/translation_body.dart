import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/translation_cubit/translation_cubit.dart';

class TranslationBody extends StatelessWidget {
  const TranslationBody({super.key});

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
                  onChange: (value) {
                    TranslationCubit.get().getTranslation();
                  },
                ),
                Row(
                  children: List.generate(3, (index) {
                    final title = index == 0 ? 'شمس' : index == 1 ?'عدالة' : 'قلب';
                    return Row(
                      children: [
                        CustomTextButton(
                          color: AppColors.suggestionsBorderColor,
                          titleColor: AppColors.suggestionsTextColor,
                          title: title,
                          outlined: true,
                          onPressed: () {
                            TranslationCubit.get().translationController.text = title;
                            TranslationCubit.get().getTranslation();
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
                            TranslationCubit.get().translationController.text = title;
                            TranslationCubit.get().getTranslation();
                          },
                        ),
                        6.horizontalSpace,
                      ],
                    );
                  }),
                ),
                // SizedBox(
                //   height: 48.h,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       CustomTextButton(
                //         onPressed: () {},
                //         icon: ImageWidget(
                //           imageUrl: AppAssets.audio,
                //           width: 24.w,
                //           height: 20.h,
                //         ),
                //       ),
                //       VerticalDivider(
                //         width: 8.w,
                //         color: AppColors.colorC7B384,
                //         indent: 10.h,
                //         endIndent: 10.h,
                //       ),
                //       CustomTextButton(
                //         onPressed: () {},
                //         icon: ImageWidget(
                //           imageUrl: AppAssets.microphone,
                //           width: 14.w,
                //           height: 22.h,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          20.verticalSpace,
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
              return state is TranslationLoading
              ? const Loading()
              : ListView.separated(
                itemBuilder: (context, index) {
                  final translation = TranslationCubit.get().translationModel?.translation?[index];
                  final egyptianSymbolUnicode  = int.parse(translation?.egyptian?[0].symbol?? '', radix: 16);
                  final egyptianWord = translation?.egyptian?[0].word;
                  final egyptian = '${translation?.egyptian?[0].word?? ''} ${String.fromCharCode(egyptianSymbolUnicode)}';
                  final arabic = translation?.arabic?.map((e) => e.word).join('، ');
                  return Container(
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
                                    fontSize: 18.sp,
                                  ),
                                  TextWidget(
                                    title: egyptian,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                  ),
                                ],
                              ),
                              12.verticalSpace,
                              TextWidget(
                                title: arabic?? '',
                                fontWeight: FontWeight.w400,
                                titleAlign: TextAlign.start,
                                maxLines: 4,
                              ),
                              const Divider(
                                color: AppColors.color84744F,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                              CustomTextButton(
                                onPressed: () {},
                                icon: ImageWidget(
                                  imageUrl: AppAssets.fav,
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
                              CustomTextButton(
                                onPressed: () {},
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
                  );
                },
                itemCount: TranslationCubit.get().translationModel?.translation?.length?? 0,
                separatorBuilder: (context, index) => 10.verticalSpace,
                shrinkWrap: true,
                primary: false,
              );
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
