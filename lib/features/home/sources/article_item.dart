// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/api/models/article.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key, required this.article});
  final Article article;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: modalSheet,
      child: Container(
        width: double.infinity,
        margin: REdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(16.r),
        ),

        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(widget.article.urlToImage ?? ""),
              ),
              SizedBox(height: 8.h),

              Text(
                widget.article.description ?? "",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.article.author ?? "",
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
                      widget.article.publishedAt ?? "",
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
      ),
    );
  }

  Future<void> modalSheet() async {
    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      builder: (context) {
        var appLocalizations = AppLocalizations.of(context)!;
        return Padding(
          padding: REdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.network(widget.article.urlToImage ?? "",),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Text(
                  widget.article.content ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: viewFullArticleContent,

                child: Text(
                  appLocalizations.view_full_article,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> viewFullArticleContent() async {
    await launchUrl(
      Uri.parse(widget.article.url ?? ""),
      mode: LaunchMode.inAppWebView,
    );
  }
}
