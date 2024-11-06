import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/handlers/remote_data_source_handler.dart';
import '../model/translation_details_model.dart';
import '../model/translation_model.dart';

abstract class TranslationRemoteDataSource {
  /// Calls the [Get] {search} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslationModel> search(Map<String, String> params);

  /// Calls the [Get] {word} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslationDetailsModel> getWordDetails(Map<String, String> params);
}

class TranslationRemoteDataSourceImpl implements TranslationRemoteDataSource {
  final NetworkManager networkManager;

  TranslationRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<TranslationModel> search(params) async {
    final response = await networkManager.request(
      endPoint: kSearch,
      method: RequestMethod.get,
      queryParameters: params,
    );
    final data = await RemoteDataSourceCallHandler()(response);
    return TranslationModel.fromJson(data);
  }

  @override
  Future<TranslationDetailsModel> getWordDetails(params) async {
    final response = await networkManager.request(
      endPoint: '$kWord/${params['id']}',
      method: RequestMethod.get,
      queryParameters: params,
    );
    final data = await RemoteDataSourceCallHandler()(response);
    return TranslationDetailsModel.fromJson(data);
  }
}