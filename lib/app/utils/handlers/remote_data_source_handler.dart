import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../../error/exceptions.dart';
import '../../model/global_response_model.dart';

class RemoteDataSourceCallHandler {
  RemoteDataSourceCallHandler();

  Future<GlobalResponseModel> call(Response res,) async {
    log(res.statusCode.toString(),name: "status code");

    // Decode the response body to handle Arabic text issue
    final decodedBody = jsonDecode(res.body);
    log(jsonEncode(decodedBody), name: "response"); // Encode back to JSON string

    final response = GlobalResponseModel.fromJson(res.body);
    if (response.errors == null) {
      if(response.authError==true && response.msg=='Unauthenticated'){
        // await getIt<CacheService>().clear();
        // navigateTo(LoginScreen(),removeAll: true);
        throw ServerException(response.msg ?? "Unauthenticated");
      }
      else if(response.status==false) {
        if (response.msg?.contains('validation error')?? false) {
          String errorMessages = "";
          response.data?.forEach((key, value) {
            if (value is List) {
              String combinedMessages = value.join(' ');
              log('$key: $combinedMessages', name: "Validation Error");
              errorMessages += '$combinedMessages\n';
            }
          });
          if(response.data.containsKey('email_verified_at')??false){
            throw AuthException(errorMessages);
          }
          throw ServerException(errorMessages);
        }
        throw ServerException(response.msg ?? "Unknown Error",);
      }
      return response;
    } else {
      // Handling nested errors
      String error = "";
      if(response.errors?.containsKey('email_verified_at')??false){
        throw AuthException(response.errors?['email_verified_at']['message'] ?? "Not Verified",);
      }
      response.errors?.forEach((key, value) {
        error += "${value['message']}\n";
      });
      throw ServerException(error.isEmpty?"unknown error${res.statusCode}":error);
    }
  }

  Future<GlobalResponseModel> handleFormData(StreamedResponse res,) async {
    log(res.statusCode.toString(),name: "status code");
    String responseData = await res.stream.bytesToString();
    log(responseData,name: "responseData");
    final response = GlobalResponseModel.fromJson(responseData);
    if (response.errors == null) {
      if(response.authError==true){
        // await getIt<CacheService>().clear();
        // navigateTo(LoginScreen(),removeAll: true);
        throw ServerException(response.msg ?? "unknown Error");
      }
      else if(response.status==false) {
        throw ServerException(response.msg ?? "unknown Error");
      }
      return response;
    } else {
      String error="";
      response.errors?.values.forEach((e) => error+="$e\n");
      throw ServerException(error.isEmpty?"unknown error${res.statusCode}":error);
    }
  }
}
