import 'package:news_app_grade/data/models/source.dart';

// generated with Dart Data class generator
class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(Map<String, dynamic> json)
      : source = (json['source'] as Map<String, dynamic>?) != null
            ? Source.fromJson(json['source'] as Map<String, dynamic>)
            : null,
        author = json['author'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        url = json['url'] as String?,
        urlToImage = json['urlToImage'] as String?,
        publishedAt = json['publishedAt'] as String?,
        content = json['content'];
}
