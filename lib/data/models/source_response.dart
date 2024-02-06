import 'package:news_app_grade/data/models/source.dart';

class SourceResponse {
  final List<Source> sources;

  SourceResponse(
    this.sources,
  );

  SourceResponse.fromJson(Map<String, dynamic> json)
      : sources = (json["sources"] as List).map((i) => Source.fromJson(i)).toList();
}
