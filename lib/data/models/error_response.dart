// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ErrorResponse {
  final String error;

  final String code;

  final String message;

  ErrorResponse({required this.error, required this.code, required this.message});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'code': code,
      'message': message,
    };
  }

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      error: map['error'] as String,
      code: map['code'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromJson(String source) => ErrorResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
