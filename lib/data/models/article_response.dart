// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'article.dart';

class ArticlesResponse {
  ArticlesResponse({
    this.articles,
    this.status,
    this.totalResults,
  });

  final List<Article>? articles;

  final String? status;

  final int? totalResults;

  factory ArticlesResponse.mock() {
    return ArticlesResponse(
      // TODO add mock library?
      status: 'status',
      totalResults: 2,
      articles: [
        Article.mock(),
        Article.mock(),
      ],
    );
  }

  factory ArticlesResponse.fromMap(Map<String, dynamic> map) {
    return ArticlesResponse(
      articles: map['articles'] != null
          ? List<Article>.from(
              (map['articles']).map<Article?>(
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'articles': articles?.map((x) => x.toMap()).toList(),
      'status': status,
      'totalResults': totalResults,
    };
  }

  String toJson() => json.encode(toMap());
}


// class ArticlesResponse {
//   ArticlesResponse({
//     this.articles,
//     this.status,
//     this.totalResults,
//   });

//   final List<Article>? articles;

//   final String? status;

//   final int? totalResults;

//   factory ArticlesResponse.fromMap(Map<String, dynamic> map) {
//     return ArticlesResponse(
//       articles: map['articles'] != null
//           ? List<Article>.from(
//               (map['articles'] as List<dynamic>).map<Article?>(
//                 (x) => Article.fromMap(x as Map<String, dynamic>),
//               ),
//             )
//           : null,
//       status: map['status'] != null ? map['status'] as String : null,
//       totalResults:
//           map['totalResults'] != null ? map['totalResults'] as int : null,
//     );
//   }

//   factory ArticlesResponse.fromJson(String source) =>
//       ArticlesResponse.fromMap(json.decode(source) as Map<String, dynamic>);
// }