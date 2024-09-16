import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class TranslationBody extends StatelessWidget {
  const TranslationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TextWidget(
                title: 'عربي',
                fontWeight: FontWeight.w400,
              ),
              ImageWidget(
                imageUrl: AppAssets.arrow,
                width: 31.w,
                height: 15.h,
              ),
              const TextWidget(
                title: 'هيروغليفي',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            height: 200.h,
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              children: [
                const CustomFormField(
                  hint: 'اكتب  هنا',
                  minLines: 2,
                  maxLines: 5,
                ),
                const Spacer(),
                SizedBox(
                  height: 48.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        onPressed: () {},
                        icon: ImageWidget(
                          imageUrl: AppAssets.audio,
                          width: 24.w,
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
                          imageUrl: AppAssets.microphone,
                          width: 14.w,
                          height: 22.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            height: 270.h,
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.colorA69670),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTextButton(
                      onPressed: () {},
                      icon: ImageWidget(
                        imageUrl: AppAssets.audio,
                        width: 24.w,
                        height: 20.h,
                      ),
                    ),
                    4.horizontalSpace,
                    TextWidget(
                      title: 'هيروغليفي',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColors.hint,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    10.horizontalSpace,
                    const TextWidget(
                      title: 'كيميت',
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                    5.horizontalSpace,
                    TextWidget(
                      title: '𓊖',
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    10.horizontalSpace,
                    const TextWidget(
                      title: 'كيميت',
                      color: Colors.transparent,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.overline,
                    ),
                    5.horizontalSpace,
                    TextWidget(
                      title: '𓊖',
                      color: Colors.transparent,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: const TextWidget(
                    title: 'مصر',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Divider(
                  color: AppColors.color84744F,
                  indent: 10.w,
                  endIndent: 10.w,
                ),
                SizedBox(
                  height: 48.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
