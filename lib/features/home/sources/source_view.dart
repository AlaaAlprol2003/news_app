import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/source.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/sources/article_item.dart';
import 'package:news_app/features/home/sources/sources_view_model.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/models/news_sources.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});
  final NewsCategory category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  SourcesViewModel sourcesViewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    sourcesViewModel.loadNewsSources(widget.category);
  }

  final List<Article> articles = [
    Article(
      source: NewsSources(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        lanaguge: "en",
        country: "us",
      ),
      author: "Rhett Jones",
      title: "New Bitcoin Protocol Makes Payments Easier",
      description: "Bitcoin is getting some Ethereum-like features.",
      url:
          "https://gizmodo.com/new-bitcoin-protocol-makes-payments-easier-2000675741",
      urlToImage:
          "https://gizmodo.com/app/uploads/2024/04/0ddbd47a359dbefbb14c16d0ffe99a95.jpg",
      publishedAt: "2025-10-22T20:44:30Z",
      content:
          "On Tuesday, Ark Labs announced the public beta launch of the highly anticipated (at least among Bitcoin purists) Arkade, which is a new upper-layer network protocol built on top of the base Bitcoin b… [+5273 chars]",
    ),
    Article(
      source: NewsSources(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        lanaguge: "en",
        country: "us",
      ),
      author: "Rhett Jones",
      title: "New Bitcoin Protocol Makes Payments Easier",
      description: "Bitcoin is getting some Ethereum-like features.",
      url:
          "https://gizmodo.com/new-bitcoin-protocol-makes-payments-easier-2000675741",
      urlToImage:
          "https://gizmodo.com/app/uploads/2024/04/0ddbd47a359dbefbb14c16d0ffe99a95.jpg",
      publishedAt: "2025-10-22T20:44:30Z",
      content:
          "On Tuesday, Ark Labs announced the public beta launch of the highly anticipated (at least among Bitcoin purists) Arkade, which is a new upper-layer network protocol built on top of the base Bitcoin b… [+5273 chars]",
    ),
    Article(
      source: NewsSources(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        lanaguge: "en",
        country: "us",
      ),
      author: "Rhett Jones",
      title: "New Bitcoin Protocol Makes Payments Easier",
      description: "Bitcoin is getting some Ethereum-like features.",
      url:
          "https://gizmodo.com/new-bitcoin-protocol-makes-payments-easier-2000675741",
      urlToImage:
          "https://gizmodo.com/app/uploads/2024/04/0ddbd47a359dbefbb14c16d0ffe99a95.jpg",
      publishedAt: "2025-10-22T20:44:30Z",
      content:
          "On Tuesday, Ark Labs announced the public beta launch of the highly anticipated (at least among Bitcoin purists) Arkade, which is a new upper-layer network protocol built on top of the base Bitcoin b… [+5273 chars]",
    ),
    Article(
      source: NewsSources(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        lanaguge: "en",
        country: "us",
      ),
      author: "Rhett Jones",
      title: "New Bitcoin Protocol Makes Payments Easier",
      description: "Bitcoin is getting some Ethereum-like features.",
      url:
          "https://gizmodo.com/new-bitcoin-protocol-makes-payments-easier-2000675741",
      urlToImage:
          "https://gizmodo.com/app/uploads/2024/04/0ddbd47a359dbefbb14c16d0ffe99a95.jpg",
      publishedAt: "2025-10-22T20:44:30Z",
      content:
          "On Tuesday, Ark Labs announced the public beta launch of the highly anticipated (at least among Bitcoin purists) Arkade, which is a new upper-layer network protocol built on top of the base Bitcoin b… [+5273 chars]",
    ),
    Article(
      source: NewsSources(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        lanaguge: "en",
        country: "us",
      ),
      author: "Rhett Jones",
      title: "New Bitcoin Protocol Makes Payments Easier",
      description: "Bitcoin is getting some Ethereum-like features.",
      url:
          "https://gizmodo.com/new-bitcoin-protocol-makes-payments-easier-2000675741",
      urlToImage:
          "https://gizmodo.com/app/uploads/2024/04/0ddbd47a359dbefbb14c16d0ffe99a95.jpg",
      publishedAt: "2025-10-22T20:44:30Z",
      content:
          "On Tuesday, Ark Labs announced the public beta launch of the highly anticipated (at least among Bitcoin purists) Arkade, which is a new upper-layer network protocol built on top of the base Bitcoin b… [+5273 chars]",
    ),
    Article(
      source: NewsSources(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        lanaguge: "en",
        country: "us",
      ),
      author: "Rhett Jones",
      title: "New Bitcoin Protocol Makes Payments Easier",
      description: "Bitcoin is getting some Ethereum-like features.",
      url:
          "https://gizmodo.com/new-bitcoin-protocol-makes-payments-easier-2000675741",
      urlToImage:
          "https://gizmodo.com/app/uploads/2024/04/0ddbd47a359dbefbb14c16d0ffe99a95.jpg",
      publishedAt: "2025-10-22T20:44:30Z",
      content:
          "On Tuesday, Ark Labs announced the public beta launch of the highly anticipated (at least among Bitcoin purists) Arkade, which is a new upper-layer network protocol built on top of the base Bitcoin b… [+5273 chars]",
    ),
    Article(
      source: NewsSources(
        id: "abc-news",
        name: "ABC News",
        description:
            "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        url: "https://abcnews.go.com",
        category: "general",
        lanaguge: "en",
        country: "us",
      ),
      author: "Rhett Jones",
      title: "New Bitcoin Protocol Makes Payments Easier",
      description: "Bitcoin is getting some Ethereum-like features.",
      url:
          "https://gizmodo.com/new-bitcoin-protocol-makes-payments-easier-2000675741",
      urlToImage:
          "https://gizmodo.com/app/uploads/2024/04/0ddbd47a359dbefbb14c16d0ffe99a95.jpg",
      publishedAt: "2025-10-22T20:44:30Z",
      content:
          "On Tuesday, Ark Labs announced the public beta launch of the highly anticipated (at least among Bitcoin purists) Arkade, which is a new upper-layer network protocol built on top of the base Bitcoin b… [+5273 chars]",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sourcesViewModel,
      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.errorMessage != null) {
                return Text(
                  provider.errorMessage!,
                  style: TextStyle(color: ColorsManager.white),
                );
              }
              List<Source> sources = provider.newssources;
              return DefaultTabController(
                length: sources.length,

                child: TabBar(
                  isScrollable: true,

                  tabs: sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
              );
            },
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  ArticleItem(article: articles[index]),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: articles.length,
            ),
          ),
        ],
      ),
    );
  }
}
