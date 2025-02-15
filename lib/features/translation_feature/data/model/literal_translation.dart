class LiteralTranslationModel {
  LiteralTranslationModel({this.literalTranslation, this.lettersMapper});

  LiteralTranslationModel.fromJson(dynamic json) {
    literalTranslation = json['literalTranslation'];
    lettersMapper = [];
    json['lettersMapper'].reversed.forEach((letterMapperObject) {
      lettersMapper?.add(LetterMapper.fromJson(letterMapperObject));
    });
  }
  String? literalTranslation;
  List<LetterMapper>? lettersMapper;
}

class LetterMapper {
  LetterMapper({this.alphabetLetters, this.hieroglyphics});

  LetterMapper.fromJson(dynamic json) {
    alphabetLetters = json['alphabetLetters'];
    hieroglyphics = json['hieroglyphics'];
  }
  String? alphabetLetters;
  String? hieroglyphics;
}
