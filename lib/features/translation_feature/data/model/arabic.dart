import 'package:hive/hive.dart';

part '../../../fav_feature/data/model/arabic.g.dart';

@HiveType(typeId: 1)
class Arabic extends HiveObject {

  @HiveField(0)
  String? word;

  Arabic({
    this.word,});

  Arabic.fromJson(dynamic json) {
    word = json['Word'];
  }
}