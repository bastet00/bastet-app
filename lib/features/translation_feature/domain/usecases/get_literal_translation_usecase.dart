import 'package:bastet_app/app/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/usecase/usecase.dart';
import '../../data/model/literal_translation.dart';
import '../repo/translation_repo.dart';

class GetLiteralTranslationUseCase implements UseCase <LiteralTranslationModel, GetLiteralTranslationUseCaseParams> {
  final TranslationRepo repository;

  GetLiteralTranslationUseCase({required this.repository});

  @override
  Future<Either<Failure, LiteralTranslationModel>> call(params) async {
    return await repository.getLiteralTranslation(params.toMap());
  }

}

class GetLiteralTranslationUseCaseParams {
  final String text; // 'arabic' or 'egyptian'

  GetLiteralTranslationUseCaseParams({required this.text});

  Map<String, String> toMap() => {'text': text};
}