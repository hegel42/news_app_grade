import 'package:news_app_grade/data/models/article.dart';

class ArticlesResponse {
  final List<Article>? articles;

  ArticlesResponse({
    this.articles,
  });

  ArticlesResponse.fromJson(Map<String, dynamic> json)
      : articles = (json['articles'] as List?)?.map((e) => Article.fromJson(e as Map<String, dynamic>)).toList();
}
