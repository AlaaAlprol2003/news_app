import 'dart:convert';

import 'package:news_app/api/models/sources_responses.dart';
import 'package:news_app/models/news_category.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "23587936ec6348f285df4d0b70a5409c";
  static const String sourcesEndpoinet = "/v2/top-headlines/sources";

  static Future<NewsSourceResponse> getNewsSources(
    NewsCategory category,
  ) async {
    Uri url = Uri.https(baseUrl, sourcesEndpoinet, {
      "apiKey": apiKey,
      "category": category.id,
    });
    http.Response serverResponse = await http.get(url); //as String
    var json = jsonDecode(serverResponse.body);// convert String to Json
    return NewsSourceResponse.fromJson(json); // convert Json to NewsSourcesResponse object
  }
}
