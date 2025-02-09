class LiteralTranslationModel {
  LiteralTranslationModel({
    this.literalTranslation});

  LiteralTranslationModel.fromJson(dynamic json) {

    literalTranslation = json['literalTranslation'];
  }
  String? literalTranslation;
}