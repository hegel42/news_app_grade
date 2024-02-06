import 'package:dio/dio.dart';
import 'package:news_app_grade/data/dio_settings/dio_exception.dart';
import 'package:news_app_grade/data/models/article_response.dart';
import 'package:news_app_grade/data/repository/repos/i_home_repo.dart';

class HomeRepo extends IHomoRepo {
  final Dio dio;

  HomeRepo({required this.dio});

  @override
  Future<ArticlesResponse> getHotArticles() async {
    try {
      final response = await dio.get('top-headlines?country=us');

      // final dataJson = response.data;

      // if (kDebugMode) {
      //   print('DataJson $dataJson');
      // }

      return ArticlesResponse.fromJson(response.data);
    } on DioException catch (e) {
      // Add
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
