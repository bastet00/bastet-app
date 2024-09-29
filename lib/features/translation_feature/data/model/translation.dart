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
    if (json['Arabic'] != null) {
      arabic = [];
      json['Arabic'].forEach((v) {
        arabic?.add(Arabic.fromJson(v));
      });
    }
    if (json['Egyptian'] != null) {
      egyptian = [];
      json['Egyptian'].forEach((v) {
        egyptian?.add(Egyptian.fromJson(v));
      });
    }
    if (json['English'] != null) {
      english = [];
      json['English'].forEach((v) {
        english?.add(English.fromJson(v));
      });
    }
  }
}