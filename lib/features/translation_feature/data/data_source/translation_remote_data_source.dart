import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/handlers/remote_data_source_handler.dart';
import '../model/translation_model.dart';

abstract class TranslationRemoteDataSource {
  /// Calls the [Get] {search} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslationModel> search(Map<String, String> map);
}

class TranslationRemoteDataSourceImpl implements TranslationRemoteDataSource {
  final NetworkManager networkManager;

  TranslationRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<TranslationModel> search(Map<String, String> map) async {
    final response = await networkManager.request(
      endPoint: kSearch,
      method: RequestMethod.get,
      queryParameters: map,
    );
    final data = await RemoteDataSourceCallHandler()(response);
    return TranslationModel.fromJson(data);
  }
}