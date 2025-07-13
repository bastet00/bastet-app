class DictionaryCategory {
  final String id;
  final String arabic;
  final String english;

  const DictionaryCategory({
    required this.id,
    required this.arabic,
    required this.english,
  });

  String getDisplayName(String languageCode) {
    return languageCode == "ar" ? arabic : english;
  }
}

class DictionaryCategories {
  static const List<DictionaryCategory> categories = [
    DictionaryCategory(id: "gods", arabic: "آلهة", english: "gods"),
    DictionaryCategory(id: "numbers", arabic: "أرقام", english: "numbers"),
    DictionaryCategory(id: "family", arabic: "عائلة", english: "family"),
    DictionaryCategory(id: "animals", arabic: "حيوانات", english: "animals"),
    DictionaryCategory(id: "colors", arabic: "ألوان", english: "colors"),
    DictionaryCategory(id: "food", arabic: "طعام", english: "food"),
    DictionaryCategory(id: "body", arabic: "جسم", english: "body"),
    DictionaryCategory(id: "symbols", arabic: "رموز", english: "symbols"),
    DictionaryCategory(id: "greetings", arabic: "تحيات", english: "greetings"),
    DictionaryCategory(id: "time", arabic: "وقت", english: "time"),
    DictionaryCategory(id: "nature", arabic: "طبيعة", english: "nature"),
    DictionaryCategory(id: "emotions", arabic: "مشاعر", english: "emotions"),
    DictionaryCategory(id: "clothes", arabic: "ملابس", english: "clothes"),
    DictionaryCategory(id: "music", arabic: "موسيقى", english: "music"),
    DictionaryCategory(id: "home", arabic: "منزل", english: "home"),
    DictionaryCategory(id: "stones", arabic: "أحجار", english: "stones"),
    DictionaryCategory(id: "temples", arabic: "معابد", english: "temples"),
    DictionaryCategory(id: "jobs", arabic: "وظائف", english: "jobs"),
    DictionaryCategory(id: "adjective", arabic: "صفات", english: "adjective"),
    DictionaryCategory(id: "verb", arabic: "افعال", english: "verb"),
    DictionaryCategory(
        id: "words_in_egyptian_dialect",
        arabic: "كلمات في العامية",
        english: "words in egyptians dialect"),
    DictionaryCategory(
        id: "prepositions", arabic: "حروف الجر", english: "prepositions"),
    DictionaryCategory(id: "insects", arabic: "حشرات", english: "insects"),
    DictionaryCategory(
        id: "measurements", arabic: "قياسات", english: "measurements"),
    DictionaryCategory(id: "countries", arabic: "دول", english: "countries"),
    DictionaryCategory(
        id: "egyptian_cities_provinces",
        arabic: "مدن و محافظات",
        english: "cities and provinces"),
    DictionaryCategory(
        id: "fruits_vegetables",
        arabic: "فواكه و خضراوات",
        english: "fruits and vegetables"),
    DictionaryCategory(id: "plants", arabic: "نباتات", english: "plants"),
    DictionaryCategory(id: "cosmos", arabic: "الكون", english: "cosmos"),
    DictionaryCategory(
        id: "female_names", arabic: "أسماء إناث", english: "female names"),
    DictionaryCategory(
        id: "male_names", arabic: "أسماء ذكور", english: "male names"),
    DictionaryCategory(
        id: "kings_queens",
        arabic: "ملوك و ملكات",
        english: "kings and queens"),
  ];
}
