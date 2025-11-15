import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_app/api/models/article.dart';
import 'package:news_app/api/models/article_responses.dart';
import 'package:news_app/api/models/source.dart';
import 'package:news_app/api/models/sources_responses.dart';
import 'package:news_app/models/news_category.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "23587936ec6348f285df4d0b70a5409c";
  static const String sourcesEndpoinet = "/v2/top-headlines/sources";
  static const String articlesEndpoinet = "/v2/everything";

  static Future<Either<String, List<Source>>> getNewsSources(
    NewsCategory category,
  ) async {
    Uri url = Uri.https(baseUrl, sourcesEndpoinet, {
      "apiKey": apiKey,
      "category": category.id,
    });
    try {
      http.Response serverResponse = await http.get(url); //as String
      var json = jsonDecode(serverResponse.body); // convert String to Json
      NewsSourceResponse sourcesResponse = NewsSourceResponse.fromJson(
        json,
      ); // convert Json to NewsSourcesResponse object
      if (sourcesResponse.status == "error") {
        return left(sourcesResponse.message ?? "");
      } else {
        return right(sourcesResponse.sources);
      }
    } catch (ex) {
      if (ex is SocketException) {
        return left("No Internt Connection");
      } else if (ex is HttpException) {
        return left("No Response");
      } else {
        return left("Bad Format");
      }
    }
  }

  static Future<Either<String, List<Article>>> getArticles(
    Source source,
  ) async {
    Uri url = Uri.https(baseUrl, articlesEndpoinet, {
      "apiKey": apiKey,
      "sources": source.id,
    });
    try{
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);

      ArticleResponses articleResponses = ArticleResponses.fromJson(json);
      if (articleResponses.status == "error") {
        return left(articleResponses.message ?? "");
      } else {
        return right(articleResponses.articles);
      }
    }catch(ex){
      if (ex is SocketException) {
        return left("No Internt Connection");
      } else if (ex is HttpException) {
        return left("No Response");
      } else {
        return left("Bad Format");
      }
    }
  }
}
