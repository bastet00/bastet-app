import 'package:bastet_app/app/error/failures.dart';
import 'package:bastet_app/features/settings_feature/data/data_source/settings_remote_data_source.dart';

import 'package:dartz/dartz.dart';

import '../../../../app/network/network_info.dart';
import '../../../../app/utils/handlers/repo_impl_callhandler.dart';
import '../../domain/repo/settings_repo.dart';

class SettingsRepoImpl extends SettingsRepo {
  final SettingsRemoteDataSource settingsRemoteDataSource;
  final NetworkInfo networkInfo;

  SettingsRepoImpl({required this.settingsRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, String>> getPrivacyPolicy() async {
    return await RepoImplCallHandler<String>(networkInfo)(() async {
      return await settingsRemoteDataSource.getPrivacyPolicy();
    });
  }
}