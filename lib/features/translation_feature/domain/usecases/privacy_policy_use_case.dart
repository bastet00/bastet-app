import 'package:bastet_app/app/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/usecase/usecase.dart';
import '../repo/translation_repo.dart';

class GetPrivacyPolicyUseCase implements UseCase<String, NoParams> {
  final TranslationRepo repository;

  GetPrivacyPolicyUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.getPrivacyPolicy();
  }
}