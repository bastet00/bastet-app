import 'dart:convert';

import '../../app/error/exceptions.dart';

class GlobalResponseModel {
  GlobalResponseModel({
    this.status,
    this.code,
    this.msg,
    this.data,
    this.authError,
    this.errors,
  });

  factory GlobalResponseModel.fromJson(String source) {
    try {
      return GlobalResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      throw DataParsingException(e.toString());
    }
  }
  GlobalResponseModel.fromMap(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['message'];
    data = json['pagination'] != null
        ? {"data": json['data'], "pagination": json['pagination']}
        : json['data'];
    json['data'];
    authError = json['code']==401||json['code']==469;
    errors = json['errors'];
  }

  bool? status;
  int? code;
  String? msg;
  dynamic data;
  bool? authError;
  Map<String,dynamic>? errors;
}