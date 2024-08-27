import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';

import '../network/network_info.dart';
import '../network/network_manager.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  //* Data sources


  //* Repository


  //* Use cases

  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  getIt.registerSingleton<NavHelper>(NavHelper());
  // getIt.registerSingleton<CacheService>(CacheService());
}