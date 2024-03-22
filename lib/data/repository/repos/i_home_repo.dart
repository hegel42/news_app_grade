import '../../models/article_response.dart';
import '../../models/source_response.dart';

abstract class IHomoRepo {
  Future<ArticlesResponse> getTopHeadlines({String? regionCode});

  Future<SourceResponse> getSources({String? regionCode});

  Future<ArticlesResponse> getLatestNews({String? regionCode});

  Future<ArticlesResponse> getArticleBySource({required String sourceId});
}
