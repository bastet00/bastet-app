const String kBaseUrl = "bastet-server-ef94bb4e91eb.herokuapp.com";
const String kBaseVersion = '';

/// end points
const String kSearch = 'word/search';
const String kWord = 'word';
const String kPrivacyPolicy = 'privacy-policy';

/// Hive Boxes
const String kFavoritesBox = 'favoritesBox';

//Static Headers
Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};