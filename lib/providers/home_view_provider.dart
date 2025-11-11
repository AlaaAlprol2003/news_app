import 'package:flutter/material.dart';
import 'package:news_app/features/home/categories/categories_view.dart';
import 'package:news_app/features/home/sources/source_view.dart';
import 'package:news_app/models/news_category.dart';

class HomeViewProvider extends ChangeNotifier {
  Widget homeView = CategoriesView();
  String title = "Home";

  void changeHomeView(NewsCategory category) {
    homeView = SourcesView(category: category);
    title = category.name;
    notifyListeners();
  }

  void backToHome(BuildContext context) {
    homeView = CategoriesView();
    title = "Home";
    Navigator.pop(context);
    notifyListeners();
  }
}
