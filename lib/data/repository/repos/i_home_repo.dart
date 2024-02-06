import 'package:news_app_grade/data/models/article_response.dart';

abstract class IHomoRepo {
  Future<ArticlesResponse> getHotArticles();
}
