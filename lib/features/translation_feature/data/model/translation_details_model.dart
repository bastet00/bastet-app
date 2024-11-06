import 'arabic.dart';
import 'egyptian.dart';
import 'english.dart';

class TranslationDetailsModel {
  TranslationDetailsModel({
      this.resources, 
      this.english, 
      this.arabic, 
      this.egyptian, 
      this.id,});

  TranslationDetailsModel.fromJson(dynamic json) {
    resources = json['resources'] != null ? json['resources'].cast<String>() : [];
    if (json['english'] != null) {
      english = [];
      json['english'].forEach((v) {
        english?.add(English.fromJson(v));
      });
    }
    if (json['arabic'] != null) {
      arabic = [];
      json['arabic'].forEach((v) {
        arabic?.add(Arabic.fromJson(v));
      });
    }
    if (json['egyptian'] != null) {
      egyptian = [];
      json['egyptian'].forEach((v) {
        egyptian?.add(Egyptian.fromJson(v));
      });
    }
    id = json['id'];
  }
  List<String>? resources;
  List<English>? english;
  List<Arabic>? arabic;
  List<Egyptian>? egyptian;
  String? id;
}