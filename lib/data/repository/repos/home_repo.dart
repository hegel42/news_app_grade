import 'package:dio/dio.dart';
import '../../dio_settings/dio_exception.dart';
import '../../models/article_response.dart';
import '../../models/source_response.dart';
import 'i_home_repo.dart';

class HomeRepo extends IHomoRepo {
  HomeRepo({required this.dio});
  final Dio dio;
// ru de fr it // us = en language/ country  code
  @override
  Future<ArticlesResponse> getTopHeadlines({String? regionCode}) async {
    try {
      final response = await dio.get(
        'top-headlines',
        queryParameters: {
          'country': (regionCode != null) ? regionCode : 'us',
        },
      );

      return ArticlesResponse.fromJson(response.toString());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<ArticlesResponse> getLatestNews({String? regionCode}) async {
    try {
      final response = await dio.get(
        'everything',
        queryParameters: {
          'pageSized': 20,
          'language': regionCode ?? 'en',
          // used for filling, api need at least one limiting parameter
          'q': 'a',
          'sortBy': 'publishedAt',
        },
        // queryParameters:
      );

      return ArticlesResponse.fromJson(response.toString());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<SourceResponse> getSources({String? regionCode}) async {
    try {
      final response = await dio.get(
        'top-headlines/sources',
        queryParameters: {
          'country': regionCode ?? 'us',
        },
      );

      return SourceResponse.fromJson(response.toString());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<ArticlesResponse> getArticleBySource({
    required String sourceId,
  }) async {
    try {
      final response = await dio.get('top-headlines?sources=$sourceId');

      return ArticlesResponse.fromJson(response.toString());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
