import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class EmptyFavWidget extends StatelessWidget {
  const EmptyFavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget(
          imageUrl: AppAssets.emptyFav,
          height: 60.h,
          width: 72.w,
        ),
        25.verticalSpace,
        TextWidget(title: AppStrings.addToFavorites.tr()),
      ],
    );
  }
}
