const String kBaseUrl = "bastet-server-ef94bb4e91eb.herokuapp.com";
const String kBaseVersion = '';

/// end points
const String kSearch = 'word/search';
const String kWord = 'word';
const String kLiteralTranslation = 'literal-translation';
const String kWordSuggestion = 'word-suggestion';
const String kPrivacyPolicy = 'privacy-policy';
const String kCategory = 'category';

/// Hive Boxes
const String kFavoritesBox = 'favoritesBox';

//Static Headers
Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};
