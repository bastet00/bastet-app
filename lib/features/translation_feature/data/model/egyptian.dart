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

  List<String>? hieroglyphicSigns;

  Egyptian({
    this.word,
    this.symbol,
    this.transliteration,
    this.hieroglyphics,
    this.hieroglyphicSigns,
  });

  Egyptian.fromJson(dynamic json) {
    word = json['word'];
    symbol = json['symbol'];
    transliteration = json['transliteration'];
    hieroglyphics = json['hieroglyphics'] != null ? json['hieroglyphics'].cast<String>() : [];
    hieroglyphicSigns = json['hieroglyphicSigns'] != null ? json['hieroglyphicSigns'].cast<String>() : [];
  }
}