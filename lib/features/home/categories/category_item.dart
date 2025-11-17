import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final NewsCategory category;
  final int index;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewProvider>(context);
    var appLocalizations = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: 230.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Align(
              alignment: index.isOdd
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Image.asset(category.imagePath, fit: BoxFit.fill),
            ),
          ),
          Align(
            alignment: index.isOdd
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Padding(
              padding: REdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    category.name,

                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.changeHomeView(category);
            },
            child: Align(
              alignment: index.isOdd
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: REdgeInsets.only(top: 50, left: 12, right: 12),

                
                width: 167.w,
                decoration: BoxDecoration(
                  color: ColorsManager.grey,
                  borderRadius: BorderRadius.circular(84.r),
                ),
                child: index.isOdd
                    ? Row(
                        children: [
                           SizedBox(width: 8.w),
                          Text(
                            appLocalizations.view_all,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        
                         Spacer(),
                          Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                index.isOdd
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_back_ios,color: ColorsManager.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                index.isOdd
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_back_ios,color: ColorsManager.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            appLocalizations.view_all,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
