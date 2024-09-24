import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/translation_feature/data/data_source/translation_remote_data_source.dart';
import '../../features/translation_feature/data/repo_impl/translation_repo_impl.dart';
import '../../features/translation_feature/domain/repo/translation_repo.dart';
import '../../features/translation_feature/domain/usecases/privacy_policy_use_case.dart';
import '../../features/translation_feature/domain/usecases/translation_use_case.dart';
import '../network/network_info.dart';
import '../network/network_manager.dart';
import '../services/cache_service.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  //* Data sources
  getIt.registerLazySingleton<TranslationRemoteDataSource>(() => TranslationRemoteDataSourceImpl(networkManager: getIt()),);

  //* Repository
  getIt.registerLazySingleton<TranslationRepo>(() => TranslationRepoImpl(translationRemoteDataSource: getIt(), networkInfo: getIt()),);


  //* Use cases
  _translationUseCases();

  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  getIt.registerSingleton<NavHelper>(NavHelper());
  getIt.registerSingleton<CacheService>(CacheService());
}

void _translationUseCases() {
  getIt.registerLazySingleton<GetTranslationUseCase>(() => GetTranslationUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetPrivacyPolicyUseCase>(() => GetPrivacyPolicyUseCase(repository: getIt()));
}