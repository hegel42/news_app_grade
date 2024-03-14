import '../../models/article_response.dart';
import '../../models/source_response.dart';

abstract class IHomoRepo {
  Future<ArticlesResponse> getTopHeadlines();

  Future<SourceResponse> getSources();

  Future<ArticlesResponse> getLatestNews();

  Future<ArticlesResponse> getArticleBySource({required String sourceId});
}
