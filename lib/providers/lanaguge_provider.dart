import 'package:flutter/material.dart';
import 'package:news_app/core/prefs_manager/prefs_manager.dart';

class LanagugeProvider extends ChangeNotifier {
  String currentLanaguge = PrefsManager.getCachedLanaguge();

  void chanageLanaguge(String selectedLang) {
    if (selectedLang == currentLanaguge) return;
    currentLanaguge = selectedLang;
    notifyListeners();
  }
}
