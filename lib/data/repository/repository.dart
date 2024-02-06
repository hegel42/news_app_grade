import 'package:dio/dio.dart';
import '../dio_settings/dio_client.dart';
import 'repos/home_repo.dart';
import 'repos/i_home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  late IHomoRepo homeRepo;
  DioClient? dioClient;

  Future init() async {
    final prefs = await SharedPreferences.getInstance();
    final dio = _getDio(prefs);

    homeRepo = HomeRepo(dio: dio);
  }

  Dio _getDio(SharedPreferences preferences) {
    dioClient = DioClient();
    return dioClient!.getDio();
  }
}
