// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/models/article.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: REdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.white),
        borderRadius: BorderRadius.circular(16.r),
      ),

      ///height: 300.h,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(article.urlToImage ?? ""),
            ),
            SizedBox(height: 8.h),

            Text(
              article.description ?? "",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 12.h),

            Row(
              children: [
                Expanded(
                  child: Text(
                    article.author ?? "",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.grey,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Text(
                    article.publishedAt ?? "",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
