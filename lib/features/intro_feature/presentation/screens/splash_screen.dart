import 'dart:async';
import 'package:bastet_app/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    Future.delayed(const Duration(seconds: 2), () {
      navigateTo(OnBoardingScreen(), removeAll: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGround,
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Center(
          child: ImageWidget(
            imageUrl: AppAssets.logo,
            width: 90.w,
            height: 150.h,
          ),
        ),
      ),
    );
  }
}
