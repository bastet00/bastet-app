import 'package:bastet_app/app/utils/app_colors.dart';
import 'package:bastet_app/app/widgets/button_widget.dart';
import 'package:bastet_app/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController controller = PageController();

  final List<String> images = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
  ];

  final List<String> titles = [
    'اللغة المصرية القديمة (الهيروغليفية) لغة الثقافة والحضارة المصرية القديمة، فضلت لغة حية لآلاف السنيين، بس دلوقتي بقت ميتة ومع إهمالها وموتها على مدار آلاف السنين اختفت الثقافة وبقت مجرد كلام على الجدران',
    'التطبيق مشروع غير ربحي هدفه تعليم المصريين لغتهم المصرية  القديمة بطريقة سهلة وبسيطة عن طريق كتابتها بالحروف العربية ودمجها مع العامية',
    'إحياء اللغة هو إعلان بداية عصر جديد، عصر النهضة والحضارة الحديثة لكيميت.\n شارك معانا في إحياء اللغة والثقافة',
  ];

  // Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: controller,
          itemCount: images.length,
          itemBuilder:(context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 1.sw,
              height: 1.sh,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index],),
                  fit: BoxFit.cover,
                  opacity: 0.67,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomTextButton(
                    title: 'تخطي',
                  ),
                  4.verticalSpace,
                  if (index == 0) Center(
                    child: ImageWidget(
                      imageUrl: AppAssets.logo,
                      width: 60.w,
                      height: 100.h,
                    ),
                  ),
                  index == 0 ? 120.verticalSpace : 200.verticalSpace,
                  index == 0 ? Center(
                    child: TextWidget(
                      title: 'أهلا بيك',
                      color: AppColors.primaryColor,
                      fontWeight: AppFonts.extraBold,
                      fontSize: AppFonts.size28,
                    ),
                  ) : ImageWidget(
                    imageUrl: AppAssets.cat,
                    width: 40.w,
                    height: 50.h,
                  ),
                  index == 0 ? 16.verticalSpace : 6.verticalSpace,
                  TextWidget(
                    title: titles[index],
                    maxLines: 7,
                  ),
                  if (index == 1) Padding(
                    padding: EdgeInsets.only(left: 160.w),
                    child: ImageWidget(
                      imageUrl: AppImages.egypt,
                      width: 108.w,
                      height: 84.h,
                    ),
                  ),
                  80.verticalSpace,
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: JumpingDotEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.primaryColor,
                        radius: 10.r,
                        dotHeight: 10.w,
                        dotWidth: 10.w,
                        spacing: 12.w,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth:  1.5,
                      ),
                    ),
                  ),
                  if (index == 2)...[
                    30.verticalSpace,
                    Center(
                      child: ButtonWidget(
                        width: 160.w,
                        text: 'ابدأ',
                        onPressed: () {},
                      ),
                    )
                  ],
                  const Spacer(),
                  Row(
                    children: [
                      if (index != 2)CustomTextButton(
                        title: 'التالي',
                        onPressed: ()=> controller.nextPage(duration: const Duration(milliseconds: 1), curve: Curves.ease),
                      ),
                      const Spacer(),
                      if (index != 0) CustomTextButton(
                        title: 'السابق',
                        onPressed: ()=> controller.previousPage(duration: const Duration(milliseconds: 1), curve: Curves.ease),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
