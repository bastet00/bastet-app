import 'package:bastet_app/app/error/failures.dart';
import 'package:bastet_app/app/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repo/translation_repo.dart';

class SuggestWordUsecase implements UseCase<void, SuggestWordUsecaseParams> {
  final TranslationRepo repository;

  SuggestWordUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.suggestWord(params.toMap());
  }
}

class SuggestWordUsecaseParams {
  final String word;
  final bool fromArabic;

  SuggestWordUsecaseParams({
    required this.word,
    required this.fromArabic,
  });

  Map<String, dynamic> toMap() {
    return fromArabic
    ? {
      'arabic': [{'word': word}]
    }
    : {
      'egyptian': [{'word': word}]
    };
  }
}
