import 'package:bastet_app/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../presentation_logic_holder/translation_cubit/translation_cubit.dart';

class SuggestWordWidget extends StatelessWidget {
  const SuggestWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.colorA69670),
      ),
      child: Column(
        children: [
          const TextWidget(
            title: 'تم توفير ترجمة حرفية في حالة ترجمة الأسماء. لو بتدور على كلمة أخرى في القاموس وعاوزنا نضيفها!',
            maxLines: 5,
            fontWeight: FontWeight.w400,
          ),
          10.verticalSpace,
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
              return CustomTextButton(
                loading: state is SuggestWordLoading,
                color: AppColors.white,
                title: 'اضغط هنا',
                outlined: true,
                onPressed: () {
                  TranslationCubit.get().suggestWord();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
