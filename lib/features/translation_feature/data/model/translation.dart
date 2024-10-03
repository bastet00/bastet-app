import 'package:hive/hive.dart';

import 'arabic.dart';
import 'egyptian.dart';
import 'english.dart';

part '../../../fav_feature/data/model/translation.g.dart';

@HiveType(typeId: 0)
class Translation extends HiveObject {

  @HiveField(0)
  String? id;

  @HiveField(1)
  List<Arabic>? arabic;

  @HiveField(2)
  List<Egyptian>? egyptian;

  @HiveField(3)
  List<English>? english;

  Translation({
    this.id,
    this.arabic,
    this.egyptian,
    this.english,});

  Translation.fromJson(dynamic json) {
    id = json['id'];
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
    if (json['english'] != null) {
      english = [];
      json['english'].forEach((v) {
        english?.add(English.fromJson(v));
      });
    }
  }
}