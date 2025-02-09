import 'package:bastet_app/features/translation_feature/data/model/literal_translation.dart';

import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/handlers/remote_data_source_handler.dart';
import '../model/translation_details_model.dart';
import '../model/translation_model.dart';

abstract class TranslationRemoteDataSource {
  /// Calls the [GET] {search} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslationModel> search(Map<String, String> params);

  /// Calls the [GET] {word} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslationDetailsModel> getWordDetails(Map<String, String> params);

  /// Calls the [POST] {suggestion} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> suggestWord(Map<String, dynamic> params);

  /// Calls the [GET] {word} endpoint.
  /// Throws a [ServerException] for all error codes.
  Future<LiteralTranslationModel> literalTranslation(Map<String, dynamic> params);
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
    );
    final data = await RemoteDataSourceCallHandler()(response);
    return TranslationDetailsModel.fromJson(data);
  }

  @override
  Future<void> suggestWord(params) async {
    await networkManager.request(
      endPoint: kWordSuggestion,
      method: RequestMethod.post,
      body: params,
    );
  }

  @override
  Future<LiteralTranslationModel> literalTranslation(params) async {
    final response = await networkManager.request(
      endPoint: kLiteralTranslation,
      method: RequestMethod.get,
      queryParameters: params,
    );
    final data = await RemoteDataSourceCallHandler()(response);
    return LiteralTranslationModel.fromJson(data);
  }
}