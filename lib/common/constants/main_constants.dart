import '../../screens/search_screen/src/model/sort_model.dart';

class MainConstants {
  static const List<SortModel> sortList = [
    SortModel(name: 'Relevance', searchId: 'relevancy'),
    SortModel(name: 'Popularity', searchId: 'popularity'),
    SortModel(name: 'Publish date', searchId: 'publishedAt'),
  ];
}
