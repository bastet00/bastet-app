import 'package:hive/hive.dart';

part '../../../fav_feature/data/model/egyptian.g.dart';

@HiveType(typeId: 2)
class Egyptian extends HiveObject {

  @HiveField(0)
  String? word;

  @HiveField(1)
  String? symbol;

  @HiveField(2)
  String? transliteration;

  @HiveField(3)
  List<String>? hieroglyphics;

  Egyptian({
    this.word,
    this.symbol,
    this.transliteration,
    this.hieroglyphics,});

  Egyptian.fromJson(dynamic json) {
    word = json['Word'];
    symbol = json['Symbol'];
    transliteration = json['Transliteration'];
    hieroglyphics = json['Hieroglyphics'] != null ? json['Hieroglyphics'].cast<String>() : [];
  }
}