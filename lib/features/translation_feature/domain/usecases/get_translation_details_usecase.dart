import 'package:bastet_app/app/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/usecase/usecase.dart';
import '../../data/model/translation_details_model.dart';
import '../repo/translation_repo.dart';

class GetTranslationDetailsUseCase implements UseCase<TranslationDetailsModel, GetTranslationDetailsUseCaseParams> {
  final TranslationRepo repository;

  GetTranslationDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, TranslationDetailsModel>> call(params) async {
    return await repository.getTranslationDetails(params.toMap());
  }

}

class GetTranslationDetailsUseCaseParams {
  final String id;

  GetTranslationDetailsUseCaseParams({required this.id});

  Map<String, String> toMap() => {'id': id};
}