import 'translation.dart';

class TranslationModel {
  TranslationModel({
    this.translation,
  });

  TranslationModel.fromJson(dynamic json) {
    if (json != null) {
      translation = [];
      json.forEach((v) {
        translation?.add(Translation.fromJson(v));
      });
    }
  }

  List<Translation>? translation;
}