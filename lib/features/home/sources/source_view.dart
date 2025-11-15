import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/models/article.dart';
import 'package:news_app/api/models/source.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/sources/article_item.dart';
import 'package:news_app/features/home/sources/article_view_model.dart';
import 'package:news_app/features/home/sources/sources_view_model.dart';
import '../../../models/news_category.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});
  final NewsCategory category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourcesViewModel;
  late ArticleViewModel articleViewModel;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    sourcesViewModel = SourcesViewModel();
    articleViewModel = ArticleViewModel();

    await sourcesViewModel.loadNewsSources(widget.category);
    if (sourcesViewModel.newssources.isNotEmpty) {
      articleViewModel.loadArticles(sourcesViewModel.newssources[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewModel),
        ChangeNotifierProvider.value(value: articleViewModel),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.errorMessage.isNotEmpty) {
                return Text(
                  provider.errorMessage,
                  style: TextStyle(color: ColorsManager.white),
                );
              }
              List<Source> sources = provider.newssources;
              return DefaultTabController(
                length: sources.length,

                child: TabBar(
                  isScrollable: true,
                  onTap: (index) {
                    articleViewModel.loadArticles(
                      sourcesViewModel.newssources[index],
                    );
                  },

                  tabs: sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
              );
            },
          ),
          Consumer<ArticleViewModel>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.erroeMessage.isNotEmpty) {
                return Center(
                  child: Text(
                    provider.erroeMessage,
                    style: TextStyle(color: ColorsManager.grey),
                  ),
                );
              }
              List<Article> articles = provider.articles;

              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ArticleItem(article: articles[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemCount: articles.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
