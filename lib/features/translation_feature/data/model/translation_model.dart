class TranslationModel {
  TranslationModel({
      this.id, 
      this.arabic, 
      this.egyptian, 
      this.english,});

  TranslationModel.fromJson(dynamic json) {
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

  String? id;
  List<Arabic>? arabic;
  List<Egyptian>? egyptian;
  List<English>? english;
}

class English {
  English({
      this.word,});

  English.fromJson(dynamic json) {
    word = json['Word'];
  }
  String? word;
}

class Egyptian {
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
  String? word;
  String? symbol;
  String? transliteration;
  List<String>? hieroglyphics;
}

class Arabic {
  Arabic({
      this.word,});

  Arabic.fromJson(dynamic json) {
    word = json['Word'];
  }
  String? word;
}