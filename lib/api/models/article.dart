import 'package:news_app/api/models/source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
    this.publishedAt
  });

  Article.fromJson(Map<String, dynamic> json)
    : this(
        source: json["source"] != null 
          ? Source.fromJson(json["source"]) 
          : null,
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: json["publishedAt"] ??"",
        content: json["content"] ?? "",
      );
}
