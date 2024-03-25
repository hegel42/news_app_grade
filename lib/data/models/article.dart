// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'source.dart';

// generated with Dart Data class generator
class Article {
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

  factory Article.mock() {
    return Article(
      content: 'Article Content',
      author: 'Author Name',
      publishedAt: '2022-01-01T00:00:00Z',
      title: 'Article Title',
      description: 'Article Description',
      source: Source.mock(),
      url: 'https://www.example.com',
      urlToImage: 'https://www.example.com/image.jpg',
    );
  }

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'] != null
          ? Source.fromMap(map['source'] as Map<String, dynamic>)
          : null,
      author: map['author'] != null ? map['author'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      urlToImage:
          map['urlToImage'] != null ? map['urlToImage'] as String : null,
      publishedAt:
          map['publishedAt'] != null ? map['publishedAt'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  String toJson() => json.encode(toMap());
}




// class Article {
//   Article({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });

//   factory Article.mock() {
//     return Article(
//         // TODO add mock library?
//         content: 'content',
//         author: 'author',
//         publishedAt: 'publishedAt',
//         title: 'title');
//   }

//   final Source? source;
//   final String? author;
//   final String? title;
//   final String? description;
//   final String? url;
//   final String? urlToImage;
//   final String? publishedAt;
//   final String? content;

//   factory Article.fromMap(Map<String, dynamic> map) {
//     return Article(
//       source: map['source'] != null
//           ? Source.fromMap(map['source'] as Map<String, dynamic>)
//           : null,
//       author: map['author'] != null ? map['author'] as String : null,
//       title: map['title'] != null ? map['title'] as String : null,
//       description:
//           map['description'] != null ? map['description'] as String : null,
//       url: map['url'] != null ? map['url'] as String : null,
//       urlToImage:
//           map['urlToImage'] != null ? map['urlToImage'] as String : null,
//       publishedAt:
//           map['publishedAt'] != null ? map['publishedAt'] as String : null,
//       content: map['content'] != null ? map['content'] as String : null,
//     );
//   }

//   factory Article.fromJson(String source) =>
//       Article.fromMap(json.decode(source) as Map<String, dynamic>);
// }