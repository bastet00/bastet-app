import 'package:bastet_app/app/widgets/loading.dart';
import 'package:bastet_app/features/translation_feature/presentation/presentation_logic_holder/translation_cubit/translation_cubit.dart';
import 'package:bastet_app/features/translation_feature/presentation/widgets/translation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/translation.dart';

class TranslationDetailsScreen extends StatefulWidget {
  final Translation translation;

  const TranslationDetailsScreen({super.key, required this.translation});

  @override
  State<TranslationDetailsScreen> createState() =>
      _TranslationDetailsScreenState();
}

class _TranslationDetailsScreenState extends State<TranslationDetailsScreen> {

  @override
  void initState() {
    super.initState();
    TranslationCubit.get().getTranslationDetails(widget.translation.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TranslationCubit, TranslationState>(
        builder: (context, state) {
          final cubit = TranslationCubit.get();
          return state is TranslationDetailsLoading
          ? const Loading()
          : SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            child: TranslationWidget(
              isDetailsScreen: true,
              translation: widget.translation,
              translationDetails: cubit.translationDetails,
            ),
          );
        },
      ),
    );
  }
}
