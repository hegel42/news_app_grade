import 'package:dio/dio.dart';
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
    final now = DateTime.now();
    final threeDaysAgo = now.subtract(const Duration(days: 3));
    final toDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final fromDate =
        "${threeDaysAgo.year}-${threeDaysAgo.month.toString().padLeft(2, '0')}-${threeDaysAgo.day.toString().padLeft(2, '0')}";
    try {
      final response = await dio.get(
        'everything?q=from=$fromDate&to=$toDate&sortBy=popularity&pageSize=20',
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
}
