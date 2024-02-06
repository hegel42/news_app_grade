import 'package:dio/dio.dart';

class DioExceptions implements Exception {

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      default:
    }
  }
  late String message;
}

String _handleError(int? statusCode, dynamic error) {
  switch (statusCode) {
    case 400:
      return 'Bad request';
    case 401:
      return 'Unauthorized';
    case 404:
      return error['message'] as String;
    case 429:
      return 'Too many requests';
    case 500:
      return 'Server Error';
    default:
      return 'Oops something went wrong';
  }
}
