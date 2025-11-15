import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/article.dart';
import 'package:news_app/api/models/source.dart';

class ArticleViewModel extends ChangeNotifier {
  List<Article> articles = [];
  bool isLoading = true;
  String erroeMessage = "";

  Future<void> loadArticles(Source source) async {
    isLoading = true;
    notifyListeners();
    var articleResponses = await APIService.getArticles(source);
    isLoading = false;
    notifyListeners();
    articleResponses.fold(
      (message) {
        erroeMessage = message;
      },
      (articlesList) {
        articles = articlesList;
      },
    );
    notifyListeners();
  }
}
