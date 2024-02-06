import 'article.dart';

class ArticlesResponse {

  ArticlesResponse({
    this.articles,
  });

  ArticlesResponse.fromJson(Map<String, dynamic> json)
      : articles = (json['articles'] as List?)?.map((e) => Article.fromJson(e as Map<String, dynamic>)).toList();
  final List<Article>? articles;
}
