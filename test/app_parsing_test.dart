import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_grade/data/models/article.dart';
import 'package:news_app_grade/data/models/article_response.dart';

void main() {
  group('ArticlesResponse parsing', () {
    test('fromJson() should parse JSON correctly', () {
      final jsonString = jsonEncode(ArticlesResponse.mock().toMap());

      final articlesResponse = ArticlesResponse.fromJson(jsonString);

      expect(articlesResponse.articles?.length, 2);
      expect(articlesResponse.status, 'status');
      expect(articlesResponse.totalResults, 2);

      final firstArticle = articlesResponse.articles?[0];

      articlesResponse.articles?.map((e) {
        expect(firstArticle?.source?.id, 'bbc-news');
        expect(firstArticle?.source?.name, 'BBC News');
        expect(firstArticle?.author, 'Author Name');
        expect(firstArticle?.title, 'Article Title');
        expect(firstArticle?.description, 'Article Description');
        expect(firstArticle?.url, 'https://www.example.com');
        expect(firstArticle?.urlToImage, 'https://www.example.com/image.jpg');
        expect(firstArticle?.publishedAt, '2022-01-01T00:00:00Z');
        expect(firstArticle?.content, 'Article Content');
      });
    });

    test('toMap() should convert to map correctly', () {
      final articlesResponse = ArticlesResponse(
        articles: [
          Article.mock(),
          Article.mock(),
        ],
        status: 'status',
        totalResults: 2,
      );

      final map = articlesResponse.toMap();

      expect(map['articles'].length, 2);
      expect(map['status'], 'status');
      expect(map['totalResults'], 2);
    });
  });
}
