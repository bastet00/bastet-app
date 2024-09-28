import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/handlers/remote_data_source_handler.dart';

abstract class SettingsRemoteDataSource {
  /// Calls the [Get] {privacy-policy} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> getPrivacyPolicy();
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final NetworkManager networkManager;

  SettingsRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<String> getPrivacyPolicy() async {
    final response = await networkManager.request(
      endPoint: kPrivacyPolicy,
      method: RequestMethod.get,
    );
    final data = await RemoteDataSourceCallHandler()(response);
    return data["privacyPolicyTextDiv"]?? "";
  }
}