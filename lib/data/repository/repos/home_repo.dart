import 'package:dio/dio.dart';
import '../../dio_settings/dio_exception.dart';
import '../../models/article_response.dart';
import 'i_home_repo.dart';

class HomeRepo extends IHomoRepo {

  HomeRepo({required this.dio});
  final Dio dio;

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
