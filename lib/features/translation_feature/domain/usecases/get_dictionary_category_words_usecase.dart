import 'package:bastet_app/app/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/usecase/usecase.dart';
import '../../data/model/translation_model.dart';
import '../repo/translation_repo.dart';

class GetDictionaryCategoryWordsUsecase
    implements
        UseCase<TranslationModel, GetDictionaryCategoryWordsUseCaseParams> {
  final TranslationRepo repository;

  GetDictionaryCategoryWordsUsecase({required this.repository});

  @override
  Future<Either<Failure, TranslationModel>> call(params) async {
    return await repository.getDictionaryCategoryWords(params.toMap());
  }
}

class GetDictionaryCategoryWordsUseCaseParams {
  final String categoryId;

  GetDictionaryCategoryWordsUseCaseParams({required this.categoryId});

  Map<String, String> toMap() => {'category_id': categoryId};
}
