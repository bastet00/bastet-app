import 'dart:async';

import 'package:async/async.dart';
import 'package:bastet_app/app/widgets/flutter_toast.dart';
import 'package:bastet_app/features/translation_feature/domain/usecases/suggest_word_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/handlers/error_state_handler.dart';
import '../../../../../app/utils/navigation_helper.dart';
import '../../../data/model/translation_details_model.dart';
import '../../../data/model/translation_model.dart';
import '../../../domain/usecases/get_translation_details_usecase.dart';
import '../../../domain/usecases/get_translation_usecase.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());
  static TranslationCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  bool fromArabic = true;
  final translationController = TextEditingController();
  TranslationModel? translationModel;
  Timer? _debounce;
  CancelableOperation? _cancelableRequest;

  TranslationDetailsModel? translationDetails;

  void convertLanguage() {
    fromArabic = !fromArabic;
    emit(ConvertLanguageState(fromArabic));
    if (translationController.text.trim().isNotEmpty) getTranslation();
  }

  Future<void> getTranslation() async {
    emit(TranslationLoading());
    if (translationController.text.trim().isEmpty) {
      return;
    }
    final response = await getIt<GetTranslationUsecase>()(GetTranslationUseCaseParams(
      word: translationController.text.trim(),
      lang: fromArabic ? 'arabic' : 'egyptian',
    ));
    response.fold(
      errorStateHandler,
      (r) {
        translationModel = r;
      },
    );
    emit(TranslationInitial());
  }

  void onTextChanged(String text) {
    // Cancel the previous debounce timer if it's still active
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    // Debounce - wait for 500ms after typing stops
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // Cancel the previous HTTP request if it's still ongoing
      _cancelableRequest?.cancel();

      _cancelableRequest = CancelableOperation.fromFuture(
        getTranslation(), // Trigger the translation request
        onCancel: () {
          debugPrint("***** Previous request canceled. *****");
        },
      );
    });
  }

  void getTranslationDetails(String id) async {
    emit(TranslationDetailsLoading());
    final response = await getIt<GetTranslationDetailsUseCase>()(GetTranslationDetailsUseCaseParams(
      id: id,
    ));
    response.fold(
      errorStateHandler,
      (r) {
        translationDetails = r;
      },
    );
    emit(TranslationInitial());
  }

  void suggestWord() async {
    emit(SuggestWordLoading());
    final response = await getIt<SuggestWordUsecase>()(SuggestWordUsecaseParams(
      word: translationController.text,
      fromArabic: fromArabic,
    ));
    response.fold(
      errorStateHandler,
      (r) {
        showToast(msg: 'لقد تم تقديم هذه الكلمة للمراجعة، شكرا لك');
        translationController.clear();
      },
    );
    emit(TranslationInitial());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    _cancelableRequest?.cancel();
    return super.close();
  }

}
