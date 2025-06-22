import 'package:bastet_app/app/utils/app_colors.dart';
import 'package:bastet_app/app/utils/helper.dart';
import 'package:bastet_app/app/widgets/button_widget.dart';
import 'package:bastet_app/app/widgets/text_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../translation_feature/presentation/screens/tab_bar_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController controller = PageController();

  final List<String> images = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
  ];

  final List<String> titles = [
    AppStrings.onBoarding1.tr(),
    AppStrings.onBoarding2.tr(),
    AppStrings.onBoarding3.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    getIt<CacheService>().setOnBoarding();
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
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (index != 2) Row(
                    children: [
                      CustomTextButton(
                        title: AppStrings.skip.tr(),
                        onPressed: ()=> navigateTo(const TabBarScreen(), removeAll: true),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (index == 0) ...[
                    Center(
                      child: ImageWidget(
                        imageUrl: AppAssets.logo,
                        width: 60.w,
                        height: 100.h,
                      ),
                    ),
                    65.verticalSpace,
                  ],
                  if (index == 1) ...[
                    Center(
                      child: ImageWidget(
                        imageUrl: AppImages.ab,
                        width: 92.w,
                        height: 73.h,
                        opacity: 0.2,
                      ),
                    ),
                    64.verticalSpace,
                  ],
                  index == 0 ? Center(
                    child: TextWidget(
                      title: AppStrings.welcome.tr(),
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
                  25.verticalSpace,
                  if (index == 1) Padding(
                    padding: EdgeInsets.only(left: 160.w),
                    child: ImageWidget(
                      imageUrl: AppImages.egypt,
                      width: 108.w,
                      height: 85.h,
                    ),
                  ),
                  index == 1 ? 35.verticalSpace : 95.verticalSpace,
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
                        text: AppStrings.start.tr(),
                        onPressed: ()=> navigateTo(const TabBarScreen(), removeAll: true),
                      ),
                    )
                  ],
                  index == 2 ? 57.verticalSpace : 140.verticalSpace,
                  Row(
                    children: [
                      if (index != 0) CustomTextButton(
                        title: AppStrings.previous.tr(),
                        onPressed: ()=> controller.previousPage(duration: const Duration(milliseconds: 1), curve: Curves.ease),
                      ),
                      const Spacer(),
                      if (index != 2)CustomTextButton(
                        title: AppStrings.next.tr(),
                        onPressed: ()=> controller.nextPage(duration: const Duration(milliseconds: 1), curve: Curves.ease),
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
