import 'package:bastet_app/app/error/failures.dart';
import 'package:bastet_app/features/translation_feature/data/model/literal_translation.dart';
import 'package:bastet_app/features/translation_feature/data/model/translation_details_model.dart';

import 'package:bastet_app/features/translation_feature/data/model/translation_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/network/network_info.dart';
import '../../../../app/utils/handlers/repo_impl_callhandler.dart';
import '../../domain/repo/translation_repo.dart';
import '../data_source/translation_remote_data_source.dart';

class TranslationRepoImpl extends TranslationRepo {
  final TranslationRemoteDataSource translationRemoteDataSource;
  final NetworkInfo networkInfo;

  TranslationRepoImpl(
      {required this.networkInfo, required this.translationRemoteDataSource});

  @override
  Future<Either<Failure, TranslationModel>> getTranslation(params) async {
    return await RepoImplCallHandler<TranslationModel>(networkInfo)(() async {
      return await translationRemoteDataSource.search(params);
    });
  }

  @override
  Future<Either<Failure, LiteralTranslationModel>> getLiteralTranslation(
      params) async {
    return await RepoImplCallHandler<LiteralTranslationModel>(networkInfo)(
        () async {
      return await translationRemoteDataSource.literalTranslation(params);
    });
  }

  @override
  Future<Either<Failure, TranslationDetailsModel>> getTranslationDetails(
      params) async {
    return await RepoImplCallHandler<TranslationDetailsModel>(networkInfo)(
        () async {
      return await translationRemoteDataSource.getWordDetails(params);
    });
  }

  @override
  Future<Either<Failure, void>> suggestWord(params) async {
    return await RepoImplCallHandler<void>(networkInfo)(() async {
      return await translationRemoteDataSource.suggestWord(params);
    });
  }

  @override
  Future<Either<Failure, TranslationModel>> getDictionaryCategoryWords(
      params) async {
    return await RepoImplCallHandler<TranslationModel>(networkInfo)(() async {
      return await translationRemoteDataSource
          .getDictionaryCategoryWords(params);
    });
  }
}
