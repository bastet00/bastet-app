import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/navigation_helper.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());
  static TranslationCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  bool fromArabic = true;

  void convertLanguage() {
    fromArabic = !fromArabic;
    emit(ConvertLanguageState(fromArabic));
  }

}
