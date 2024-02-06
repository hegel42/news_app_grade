import '../../models/article_response.dart';

abstract class IHomoRepo {
  Future<ArticlesResponse> getHotArticles();
}
