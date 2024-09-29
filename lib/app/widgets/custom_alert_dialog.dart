import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../../app/utils/app_strings.dart';
import '../../app/utils/get_it_injection.dart';
import '../../app/utils/helper.dart';
import '../../app/utils/navigation_helper.dart';
import 'button_widget.dart';
import 'text_widget.dart';

globalAlertDialogue(String title1,
    {
      String? title2,
      VoidCallback? onCancel,
      VoidCallback? onOk,
      String ?buttonText,
      String ?buttonText2,
      IconData? iconData,
      Color? iconDataColor,
      Color? iconBackColor,
      bool canCancel = false,
    }) {
  showDialog(
    context: getIt<NavHelper>().navigatorKey.currentState!.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 250,
        width: 450.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          alignment: Alignment.center,
          backgroundColor: AppColors.scaffoldBackGround,
          title: Container(
            width: 72.w,
            height: 72.h,
            decoration: BoxDecoration(
              color:iconBackColor?? AppColors.primaryColor,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Icon(
                iconData??Icons.check_rounded,
                color: iconDataColor??AppColors.white,
                size: 40.sp,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.sp,
                ),
              ),
              title2==null?const SizedBox():Text(
                title2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    // color: AppColors.green,
                    fontSize: 14.sp,
                  // fontFamily: fontRegular,
                ),
              ),
              const SizedBox(height: 24,),
              canCancel?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      onPressed: onCancel?? () {
                        Navigator.pop(context);
                      },
                      border: Border.all(color: AppColors.primaryColor),
                      color: AppColors.white,
                      outlined: false,
                      child: Center(
                        child: Text(
                          buttonText??'موافق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: ButtonWidget(
                      onPressed: onOk?? () {
                        Navigator.pop(context);
                      },
                      color: AppColors.primaryColor,
                      child: Center(
                        child: Text(
                          buttonText2??AppStrings.ok,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  :
              ButtonWidget(
                outlined: true,
                onPressed: onOk?? () {
                      Navigator.pop(context);
                    },
                child: Center(
                  child: Text(
                    buttonText??'موافق',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp
                    ),
              ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

globalAlertDialogueWithDuration(String title1,
    {
      String? title2,
      IconData? iconData,
      int? seconds,
      required VoidCallback onOk,
    }) {
  showDialog(
    context: getIt<NavHelper>().navigatorKey.currentState!.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 336.h,
        width: 348.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
          // insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          alignment: Alignment.center,
          backgroundColor: AppColors.white,
          title: Center(
            child: Icon(
              iconData??Icons.check_circle,
              color: AppColors.secondaryColor,
              size: 46,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                title: title1,
                fontSize: 24.sp,
                titleAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
              Text(
                title2??"",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 18.sp,
                  fontFamily: fontRegular,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  Future.delayed(Duration(seconds:seconds??2),(){
   onOk();
  });
}
