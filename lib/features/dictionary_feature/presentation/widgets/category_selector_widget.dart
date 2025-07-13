import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../data/dictionary_categories.dart';

class CategorySelectorWidget extends StatelessWidget {
  final String selectedCategory;
  final void Function(String) onCategorySelected;

  const CategorySelectorWidget({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(
        top: 10.h,
        bottom: 25.h,
        right: 8.w,
        left: 8.w,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DictionaryCategories.categories.length,
        itemBuilder: (context, index) {
          final category = DictionaryCategories.categories[index];
          final isSelected = selectedCategory == category.id;

          return GestureDetector(
            onTap: () => onCategorySelected(category.id),
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.dictionaryCategoryBackground,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: isSelected
                      ? AppColors.dictionaryCategoryBorder
                      : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  category.getDisplayName(context.locale.languageCode),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.dictionaryCategoryText,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
