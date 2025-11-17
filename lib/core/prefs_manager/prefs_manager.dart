import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void cacheTheme(ThemeMode selectedTheme) {
    String cachedTheme = selectedTheme == ThemeMode.light ? "Light" : "Dark";
    prefs.setString("saved_theme", cachedTheme);
  }

  static ThemeMode getCachedTheme() {
    ThemeMode cachedTheme = prefs.getString("saved_theme") == "Light"
        ? ThemeMode.light
        : ThemeMode.dark;
    return cachedTheme;
  }

  static void cacheLanaguge(String selectedlang) {
    String cachelang = selectedlang == "English" ? "en" : "ar";
    prefs.setString("saved_lanaguge", cachelang);
  }

  static String getCachedLanaguge() {
    String cachedLanaguge = prefs.getString("saved_lanaguge") ?? "en";
    return cachedLanaguge;
  }
}
