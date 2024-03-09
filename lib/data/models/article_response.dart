// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'article.dart';

class ArticlesResponse {
  ArticlesResponse({
    this.articles,
    this.status,
    this.totalResults,
  });

  // ArticlesResponse.fromJson(Map<String, dynamic> json)
  //     : articles = (json['articles'] as List?)
  //           ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
  //           .toList();
  final List<Article>? articles;

  final String? status;

  final int? totalResults;

  factory ArticlesResponse.fromMap(Map<String, dynamic> map) {
    return ArticlesResponse(
      articles: map['articles'] != null
          ? List<Article>.from(
              (map['articles'] as List<dynamic>).map<Article?>(
                (x) => Article.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      totalResults:
          map['totalResults'] != null ? map['totalResults'] as int : null,
    );
  }

  factory ArticlesResponse.fromJson(String source) =>
      ArticlesResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
