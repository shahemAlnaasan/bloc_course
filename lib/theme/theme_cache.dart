import 'package:shared_preferences/shared_preferences.dart';

class ThemeCache {
  Future<void> storeThemeIndex(int themeIndex) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("THEME_INDEX", themeIndex);
  }

  Future<int> getThemeIndex() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int themeindex = sharedPreferences.getInt("THEME_INDEX") ?? 0;

    return themeindex;
  }
}
