import 'source.dart';

class SourceResponse {

  SourceResponse(
    this.sources,
  );

  SourceResponse.fromJson(Map<String, dynamic> json)
      : sources = (json['sources'] as List).map((i) => Source.fromJson(i)).toList();
  final List<Source> sources;
}
