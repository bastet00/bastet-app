import 'package:bastet_app/app/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/usecase/usecase.dart';
import '../../data/model/literal_translation.dart';
import '../repo/translation_repo.dart';

class GetLiteralTranslationUseCase
    implements
        UseCase<LiteralTranslationModel, GetLiteralTranslationUseCaseParams> {
  final TranslationRepo repository;

  GetLiteralTranslationUseCase({required this.repository});

  @override
  Future<Either<Failure, LiteralTranslationModel>> call(params) async {
    return await repository.getLiteralTranslation(params.toMap());
  }
}

class GetLiteralTranslationUseCaseParams {
  final String text;
  final String useMultiLetterSymbols;
  final String? gender;

  GetLiteralTranslationUseCaseParams(
      {required this.text, required this.useMultiLetterSymbols, this.gender});

  Map<String, String> toMap() {
    final map = {'text': text, 'useMultiLetterSymbols': useMultiLetterSymbols};
    if (gender != null) {
      map['gender'] = gender!;
    }
    return map;
  }
}
