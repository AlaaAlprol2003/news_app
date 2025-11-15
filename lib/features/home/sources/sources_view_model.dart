
import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/source.dart';
import 'package:news_app/models/news_category.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source> newssources = [];
  bool isLoading = true;
  String errorMessage = "";

  Future<void> loadNewsSources(NewsCategory category) async {
  
    isLoading = true;
    notifyListeners();
    var sourceResponse = await APIService.getNewsSources(category);
    isLoading = false;
    sourceResponse.fold(
      (message) {
        errorMessage = message;
        notifyListeners();
      },
      (sources) {
        newssources = sources;
        notifyListeners();
      },
    );
  
  }
}
