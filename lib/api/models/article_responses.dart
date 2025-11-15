import 'package:news_app/api/models/article.dart';

class ArticleResponses {
  String status;
  int totalResults;
  String? code;
  String?message;
  List<Article> articles;

  ArticleResponses({
    required this.status,
    required this.totalResults,
    required this.articles,
    this.code,
    this.message
  });

  factory ArticleResponses.fromJson(Map<String, dynamic> json) {
    return ArticleResponses(
      status: json["status"],
      totalResults: json["totalResults"],
      code: json["code"]?? "",
      message: json["message"]??"",
      articles: (json['articles'] as List<dynamic>)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }
}
