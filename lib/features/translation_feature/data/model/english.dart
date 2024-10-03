import 'package:hive/hive.dart';

part '../../../fav_feature/data/model/english.g.dart';

@HiveType(typeId: 3)
class English extends HiveObject {

  @HiveField(0)
  String? word;

  English({
    this.word,});

  English.fromJson(dynamic json) {
    word = json['word'];
  }
}