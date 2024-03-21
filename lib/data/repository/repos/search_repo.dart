import 'package:dio/dio.dart';

import '../../dio_settings/dio_exception.dart';
import '../../models/article_response.dart';
import 'i_search_repo.dart';

class SearchRepo extends ISearchRepo {
  SearchRepo({required this.dio});

  final Dio dio;

  @override
  Future<ArticlesResponse> getSearchArticles({
    required String searchText,
    required String sortId,
  }) async {
    try {
      final response = await dio.get(
        'everything',
        queryParameters: {
          'q': searchText,
          'sortBy': sortId,
        },
      );

      return ArticlesResponse.fromJson(response.toString());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
