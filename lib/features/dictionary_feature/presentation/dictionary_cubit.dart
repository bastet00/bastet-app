import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/utils/get_it_injection.dart';
import '../../../app/utils/handlers/error_state_handler.dart';
import '../../../app/utils/navigation_helper.dart';
import '../../translation_feature/data/model/translation.dart';
import '../../translation_feature/domain/usecases/get_dictionary_category_words_usecase.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  DictionaryCubit() : super(DictionaryInitial());
  static DictionaryCubit get() {
    final currentState = getIt<NavHelper>().navigatorKey.currentState;
    if (currentState == null) {
      throw Exception(
          "Navigator's currentState is null. Ensure the navigator is properly initialized.");
    }
    return BlocProvider.of(currentState.context);
  }

  List<Translation> categoryTranslations = [];

  Future<void> getCategoryWords(String categoryId) async {
    try {
      emit(DictionaryLoading());

      // Clear the list immediately when loading new category
      categoryTranslations = [];

      final response = await getIt<GetDictionaryCategoryWordsUsecase>()(
        GetDictionaryCategoryWordsUseCaseParams(categoryId: categoryId),
      );

      response.fold(
        errorStateHandler,
        (translationModel) {
          categoryTranslations = translationModel.translation ?? [];
        },
      );

      emit(DictionaryInitial());
    } catch (e) {
      // Handle any unexpected errors
      categoryTranslations = [];
      emit(DictionaryInitial());
    }
  }
}
