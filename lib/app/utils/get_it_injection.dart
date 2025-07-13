import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/settings_feature/data/data_source/settings_remote_data_source.dart';
import '../../features/settings_feature/data/repo_impl/settings_repo_impl.dart';
import '../../features/settings_feature/domain/repo/settings_repo.dart';
import '../../features/translation_feature/data/data_source/translation_remote_data_source.dart';
import '../../features/translation_feature/data/repo_impl/translation_repo_impl.dart';
import '../../features/translation_feature/domain/repo/translation_repo.dart';
import '../../features/settings_feature/domain/usecases/privacy_policy_use_case.dart';
import '../../features/translation_feature/domain/usecases/get_translation_details_usecase.dart';
import '../../features/translation_feature/domain/usecases/get_translation_usecase.dart';
import '../../features/translation_feature/domain/usecases/suggest_word_usecase.dart';
import '../../features/translation_feature/domain/usecases/get_literal_translation_usecase.dart';
import '../../features/translation_feature/domain/usecases/get_dictionary_category_words_usecase.dart';

import '../network/network_info.dart';
import '../network/network_manager.dart';
import '../services/cache_service.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //* Data sources
  getIt.registerLazySingleton<TranslationRemoteDataSource>(
    () => TranslationRemoteDataSourceImpl(networkManager: getIt()),
  );
  getIt.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(networkManager: getIt()),
  );

  //* Repository
  getIt.registerLazySingleton<TranslationRepo>(
    () => TranslationRepoImpl(
        translationRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<SettingsRepo>(
    () => SettingsRepoImpl(
        settingsRemoteDataSource: getIt(), networkInfo: getIt()),
  );

  //* Use cases
  _translationUseCases();
  _settingsUseCases();

  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  getIt.registerSingleton<NavHelper>(NavHelper());
  getIt.registerSingleton<CacheService>(CacheService());
}

void _translationUseCases() {
  getIt.registerLazySingleton<GetTranslationUsecase>(
      () => GetTranslationUsecase(repository: getIt()));
  getIt.registerLazySingleton<GetTranslationDetailsUseCase>(
      () => GetTranslationDetailsUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetLiteralTranslationUseCase>(
      () => GetLiteralTranslationUseCase(repository: getIt()));
  getIt.registerLazySingleton<SuggestWordUsecase>(
      () => SuggestWordUsecase(repository: getIt()));
  getIt.registerLazySingleton<GetDictionaryCategoryWordsUsecase>(
      () => GetDictionaryCategoryWordsUsecase(repository: getIt()));
}

void _settingsUseCases() {
  getIt.registerLazySingleton<GetPrivacyPolicyUseCase>(
      () => GetPrivacyPolicyUseCase(repository: getIt()));
}
