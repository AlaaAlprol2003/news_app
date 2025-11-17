import 'package:flutter/material.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';

class NewsCategory {
  String id;
  String name;
  String imagePath;

  NewsCategory({required this.id, required this.name, required this.imagePath});

  static List<NewsCategory> newsCategories(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return [
      NewsCategory(
        id: "general",
        name: appLocalizations.general,
        imagePath: ImageAssets.generalNews,
      ),
      NewsCategory(
        id: "business",
        name: appLocalizations.business,
        imagePath: ImageAssets.businessNews,
      ),
      NewsCategory(
        id: "entertainment",
        name: appLocalizations.entertainment,
        imagePath: ImageAssets.entertainmentNews,
      ),
      NewsCategory(
        id: "health",
        name: appLocalizations.health,
        imagePath: ImageAssets.healthNews,
      ),
      NewsCategory(
        id: "science",
        name: appLocalizations.science,
        imagePath: ImageAssets.scienceNews,
      ),

      NewsCategory(
        id: "technology",
        name:appLocalizations.technology,
        imagePath: ImageAssets.techNews,
      ),
      NewsCategory(
        id: "sports",
        name:appLocalizations.sports,
        imagePath: ImageAssets.sportsNews,
      ),
    ];
  }
}
