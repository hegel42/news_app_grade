import 'package:dio/dio.dart';
import 'package:news_app_grade/data/dio_settings/dio_client.dart';
import 'package:news_app_grade/data/repository/repos/home_repo.dart';
import 'package:news_app_grade/data/repository/repos/i_home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  late IHomoRepo homeRepo;
  DioClient? dioClient;

  Future init() async {
    final _prefs = await SharedPreferences.getInstance();
    final _dio = _getDio(_prefs);

    homeRepo = HomeRepo(dio: _dio);
  }

  Dio _getDio(SharedPreferences preferences) {
    dioClient = DioClient();
    return dioClient!.getDio();
  }
}
