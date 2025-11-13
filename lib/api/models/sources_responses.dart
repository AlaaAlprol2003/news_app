import 'package:news_app/api/models/source.dart';

class NewsSourceResponse {
  final String status;
  final String? code;
  final String? message;

  final List<Source> sources;

  NewsSourceResponse({
    this.message,
    this.code,
    required this.status,
    required this.sources,
  });

  factory NewsSourceResponse.fromJson(Map<String, dynamic> json) {
    return NewsSourceResponse(
      status: json['status'] ?? '',
      code: json['code'] ?? "",
      message: json['message'] ?? "",
      // هجيب المفتاح اللى اسمه sources
      // القيمة بتاعته عبارة عن List<Source> بس فى شكل json
      // همشى على القائمة واخد كل عنصر احوله الى Source Object
      sources: json["sources"] is List<dynamic>
          ? (json['sources'] as List<dynamic>)
                .map((e) => Source.fromJson(e))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      // القيمة بتاعت sources key
      // عبارة عن القائمة بتاعت المصادر اللى هى من نوع مصدر
      // وهاخد كل مصدر فى القائمة اللى هى Source
      //  اللى فيه الاسم والوصف والتفاصيل دى وهحولها الى json
      'sources': sources.map((source) => source.toJson()).toList(),
    };
  }
}
