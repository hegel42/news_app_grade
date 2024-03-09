// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Source {
  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.country,
    required this.language,
  });

  final dynamic id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? country;
  final String? language;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'country': country,
      'language': language,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] as dynamic,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) =>
      Source.fromMap(json.decode(source) as Map<String, dynamic>);
}
