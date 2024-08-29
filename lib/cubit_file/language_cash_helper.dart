import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> storeLanguageCode(String languageCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Local", languageCode);
  }

  Future<String> getLanguageCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? languageCode = sharedPreferences.getString("Local");

    if (languageCode != null) {
      return languageCode;
    }
    return "en";
  }
}
