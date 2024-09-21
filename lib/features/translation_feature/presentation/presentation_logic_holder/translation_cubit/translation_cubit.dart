import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/handlers/error_state_handler.dart';
import '../../../../../app/utils/navigation_helper.dart';
import '../../../data/model/translation_model.dart';
import '../../../domain/usecases/translation_use_case.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());
  static TranslationCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  bool fromArabic = true;
  final translationController = TextEditingController();
  TranslationModel? translationModel;

  void convertLanguage() {
    fromArabic = !fromArabic;
    emit(ConvertLanguageState(fromArabic));
    if (translationController.text.isNotEmpty) getTranslation();
  }

  void getTranslation() async {
    emit(TranslationLoading());
    final response = await getIt<GetTranslationUseCase>()(GetTranslationUseCaseParams(
      word: translationController.text,
      lang: fromArabic ? 'Arabic' : 'Egyptian',
    ));
    response.fold(
      errorStateHandler,
      (r) {
        translationModel = r;
      },
    );
    emit(TranslationInitial());
  }

}
