import 'package:bastet_app/features/translation_feature/presentation/widgets/translation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/loading.dart';
import '../presentation/dictionary_cubit.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryCubit, DictionaryState>(
      builder: (context, state) {
        final cubit = DictionaryCubit.get();

        // Load category words when the screen is first built
        if (cubit.categoryTranslations.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            cubit.getCategoryWords("gods");
          });
        }

        if (state is DictionaryLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
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
