import '../../models/article_response.dart';

abstract class ISearchRepo {
  Future<ArticlesResponse> getSearchArticles({
    required String searchText,
    required String sortId,
  });
}
