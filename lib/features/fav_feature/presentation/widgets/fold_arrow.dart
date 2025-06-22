import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../presentation_logic_holder/fav_cubit/fav_cubit.dart';

class FoldArrowWidget extends StatelessWidget {

  const FoldArrowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return CustomTextButton(
          onPressed: () {
          },
          icon: ImageWidget(
            imageUrl: AppAssets.favSolid,
            width: 20.w,
            height: 20.h,
          ),
        );
      },
    );
  }
}
