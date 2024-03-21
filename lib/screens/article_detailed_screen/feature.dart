import 'package:flutter/cupertino.dart';

import '../../data/models/article.dart';
import 'src/article_detailed_screen.dart';

CupertinoPageRoute articleDetailedScreenRoute(Article article) {
  return CupertinoPageRoute(
    builder: (context) => ArticleDetailedScreen(
      article: article,
    ),
  );
}
