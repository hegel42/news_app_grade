import 'package:dio/dio.dart';
import '../../../common/utils/formatter_utlis.dart';
import '../../dio_settings/dio_exception.dart';
import '../../models/article_response.dart';
import '../../models/source_response.dart';
import 'i_home_repo.dart';

class HomeRepo extends IHomoRepo {
  HomeRepo({required this.dio});
  final Dio dio;

  @override
  Future<ArticlesResponse> getTopHeadlines() async {
    try {
      final response = await dio.get('top-headlines?country=us');

      return ArticlesResponse.fromJson(response.toString());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<ArticlesResponse> getLatestNews() async {
    // TODO add request model
    final fromDate = Formatter.requestDateFormatter(DateTime.now().toString());
    final toDate = Formatter.requestDateFormatter(
      DateTime.now().subtract(const Duration(days: 3)).toString(),
    );

    try {
      final response = await dio.get(
        'everything?q=from=$fromDate&to=$toDate&pageSize=20',
        // queryParameters:
      );

      return ArticlesResponse.fromJson(response.toString());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<SourceResponse> getSources() async {
    try {
      final response = await dio
          .get('top-headlines/sources', queryParameters: {'country': 'us'});

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
