// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'source.dart';

class SourceResponse {
  SourceResponse(
    this.sources,
  );

  final List<Source> sources;

  factory SourceResponse.fromMap(Map<String, dynamic> map) {
    return SourceResponse(
      List<Source>.from(
        (map['sources'] as List<dynamic>).map<Source>(
          (x) => Source.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory SourceResponse.fromJson(String source) =>
      SourceResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
