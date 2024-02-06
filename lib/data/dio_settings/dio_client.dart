import 'package:dio/dio.dart';
import 'package:news_app_grade/common/constants/network_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final options = BaseOptions(
    baseUrl: NetworkConstants.BASE_URL,
    connectTimeout: NetworkConstants.apiTimeOut,
    receiveTimeout: NetworkConstants.apiTimeOut,
    queryParameters: {'apiKey': NetworkConstants.KEY},
  );

  late final dio = Dio(options)
    ..interceptors.addAll(
      [
        _BasicInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          compact: false,
        ),
      ],
    );

  Dio getDio() {
    return dio;
  }
}

class _BasicInterceptor implements Interceptor {
  @override
  void onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
