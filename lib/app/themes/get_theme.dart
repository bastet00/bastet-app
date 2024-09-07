import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

  ThemeData appTheme() {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
    ),
    primaryColor: AppColors.primaryColor,
    dividerColor: AppColors.dividerColor,
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerColor,
    ),
    indicatorColor: Colors.black,
    highlightColor: AppColors.dividerColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.drawerColor,
      scrimColor: AppColors.scrimColor,
      shape: Border(),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primaryColor),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.secondaryColor,
        )
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      dividerColor: AppColors.primaryColor,
      headerHeadlineStyle:TextStyle(
        fontSize: 24.sp,
      ),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.white,
      iconColor: AppColors.primaryColor,
    ),
    listTileTheme: const ListTileThemeData(),
    iconTheme: const IconThemeData(color: AppColors.primaryColor,),
    scaffoldBackgroundColor: AppColors.scaffoldBackGround,
    cardColor: Colors.white,
    cardTheme: const CardTheme(color: Colors.white),
    focusColor: AppColors.descriptionColor,
    hintColor: AppColors.descriptionColor,
    fontFamily: "Noto Sans Arabic",
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
    ) ,
     canvasColor: Colors.transparent,
     // fontFamily: AppFonts.poppins,
      useMaterial3: true,
      /// App bar theme
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.scaffoldBackGround,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: false,
      backgroundColor: AppColors.scaffoldBackGround,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 22.sp,
        fontFamily: "Noto Sans Arabic",
        color: AppColors.white,
      ),
    ),
  );
}
