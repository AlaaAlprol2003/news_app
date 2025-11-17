import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/categories/category_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/models/news_category.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 15.0, horizontal: 12),
      child: Column(
        children: [
          Text(
            appLocalizations.welcome_message,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: NewsCategory.newsCategories(context).length,
              itemBuilder: (context, index) => CategoryItem(
                category: NewsCategory.newsCategories(context)[index],
                index: index + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
