import 'package:bastet_app/app/error/failures.dart';

import 'package:bastet_app/features/translation_feature/data/model/translation_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/network/network_info.dart';
import '../../../../app/utils/handlers/repo_impl_callhandler.dart';
import '../../domain/repo/translation_repo.dart';
import '../data_source/translation_remote_data_source.dart';

class TranslationRepoImpl extends TranslationRepo {
  final TranslationRemoteDataSource translationRemoteDataSource;
  final NetworkInfo networkInfo;

  TranslationRepoImpl({required this.networkInfo, required this.translationRemoteDataSource});

  @override
  Future<Either<Failure, TranslationModel>> getTranslation(map) async {
    return await RepoImplCallHandler<TranslationModel>(networkInfo)(() async {
      return await translationRemoteDataSource.search(map);
    });
  }

  @override
  Future<Either<Failure, String>> getPrivacyPolicy() async {
    return await RepoImplCallHandler<String>(networkInfo)(() async {
      return await translationRemoteDataSource.getPrivacyPolicy();
    });
  }

}