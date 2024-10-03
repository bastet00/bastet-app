import 'package:bastet_app/app/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/usecase/usecase.dart';
import '../../data/model/translation_model.dart';
import '../repo/translation_repo.dart';

class GetTranslationUseCase implements UseCase <TranslationModel, GetTranslationUseCaseParams> {
  final TranslationRepo repository;

  GetTranslationUseCase({required this.repository});

  @override
  Future<Either<Failure, TranslationModel>> call(params) async {
    return await repository.getTranslation(params.toMap());
  }

}

class GetTranslationUseCaseParams {
  final String word;
  final String lang; // 'arabic' or 'egyptian'

  GetTranslationUseCaseParams({required this.word,required this.lang});

  Map<String, String> toMap() => {'word': word, 'lang': lang};
}