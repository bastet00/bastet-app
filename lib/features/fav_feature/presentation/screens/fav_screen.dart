import 'package:bastet_app/app/utils/app_assets.dart';
import 'package:bastet_app/app/utils/app_colors.dart';
import 'package:bastet_app/app/widgets/custom_form_field.dart';
import 'package:bastet_app/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../translation_feature/presentation/widgets/translation_widget.dart';
import '../presentation_logic_holder/fav_cubit.dart';
import '../widgets/empty_fav_widget.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        final cubit = FavCubit.get();
        return cubit.favoriteTranslations.isEmpty
        ? const EmptyFavWidget()
        : Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
          child: Column(
            children: [
              CustomFormField(
                controller: cubit.searchController,
                onChange: (text) {
                  cubit.filterFavorites();
                },
                hint: 'ابحث بالهيروغليفية',
                hintColor: AppColors.searchHintColor,
                textColor: AppColors.primaryColor,
                fillColor: AppColors.searchFormColor,
                height: 50.h,
                prefixIconWidget: ImageWidget(
                  imageUrl: AppAssets.search,
                  height: 16.h,
                  width: 16.w,
                ),
                borderRadiusValue: 50.r,
              ),
              20.verticalSpace,
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return TranslationWidget(
                      translation: cubit.filteredTranslations[index],
                    );
                  },
                  itemCount: cubit.filteredTranslations.length,
                  separatorBuilder: (context, index) => 10.verticalSpace,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 20.h),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
