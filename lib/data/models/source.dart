// generated with Dart Data class generator
class Source {

  Source(
      {required this.id,
      required this.name,
      required this.description,
      required this.url,
      required this.category,
      required this.country,
      required this.language,});

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        url = json['url'],
        category = json['category'],
        country = json['country'],
        language = json['language'];
  final dynamic id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? country;
  final String? language;
}
