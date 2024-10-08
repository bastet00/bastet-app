import 'dart:async';

import 'package:async/async.dart';
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
  Timer? _debounce;
  CancelableOperation? _cancelableRequest;

  void convertLanguage() {
    fromArabic = !fromArabic;
    emit(ConvertLanguageState(fromArabic));
    if (translationController.text.trim().isNotEmpty) getTranslation();
  }

  Future<void> getTranslation() async {
    emit(TranslationLoading());
    final response = await getIt<GetTranslationUseCase>()(GetTranslationUseCaseParams(
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

  @override
  Future<void> close() {
    _debounce?.cancel();
    _cancelableRequest?.cancel();
    return super.close();
  }

}
