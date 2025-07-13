import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/loading.dart';
import '../../../../features/translation_feature/presentation/widgets/translation_widget.dart';
import '../dictionary_cubit.dart';

class DictionaryContentWidget extends StatelessWidget {
  const DictionaryContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryCubit, DictionaryState>(
      builder: (context, state) {
        final cubit = DictionaryCubit.get();

        if (state is DictionaryLoading) {
          return const Loading();
        }

        if (cubit.categoryTranslations.isEmpty) {
          return Center(
            child: Text(
              'لا توجد ترجمات لهذه الفئة',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return TranslationWidget(
                translation: cubit.categoryTranslations[index],
              );
            },
            itemCount: cubit.categoryTranslations.length,
            separatorBuilder: (context, index) => 10.verticalSpace,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 20.h),
          ),
        );
      },
    );
  }
}
