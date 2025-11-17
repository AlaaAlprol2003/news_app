import 'package:flutter/material.dart';
import 'package:news_app/core/prefs_manager/prefs_manager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getCachedTheme();

  void changeTheme(ThemeMode selectedTheme){
    if(selectedTheme == currentTheme) return;
    currentTheme = selectedTheme;
    notifyListeners();
  }
}