import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

class RemoteDataSourceCallHandler {
  RemoteDataSourceCallHandler();

  Future<dynamic> call(Response res,) async {
    log(res.statusCode.toString(),name: "status code");

    // Decode the response body to handle Arabic text issue
    if (res.body.isNotEmpty) {
      final decodedBody = jsonDecode(res.body);
      log(jsonEncode(decodedBody), name: "response"); // Encode back to JSON string
      return decodedBody;
    }

    }
  }
