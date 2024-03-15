import 'package:flutter/material.dart';

import '../../../common/widgets/main_app_bar.dart';
import '../../../data/models/article.dart';

class ArticleDetailedScreen extends StatelessWidget {
  const ArticleDetailedScreen({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // final String formattedDate =
    //     formatDate(articles.publishedAt, Localizations.localeOf(context));
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(title: 'title'),
        body: Column(
          children: [
            // Expanded(
            //   child: CustomScrollView(
            //     slivers: [
            //       SliverAppBar(
            //         // leading: IconButton(
            //         //   icon: Icon(
            //         //     Icons.arrow_back,
            //         //     color: themeProvider.isDarkMode
            //         //         ? AppColors.backgroundLight
            //         //         : AppColors.backgroundDark,
            //         //   ),
            //         //   onPressed: () => Navigator.of(context).pop(),
            //         // ),
            //         title: Padding(
            //           padding: const EdgeInsets.all(8),
            //           child: Text(
            //             article.title ?? 'Article',
            //             // style:
            //             //     themeBasedStyle(themeProvider, AppStyleText.mainText),
            //           ),
            //         ),
            //         pinned: true,
            //         backgroundColor: Colors.transparent,
            //         expandedHeight: 350,
            //         flexibleSpace: FlexibleSpaceBar(
            //           background: Container(
            //             padding: const EdgeInsets.only(top: 120),
            //             width: double.infinity,
            //             height: double.infinity,
            //             child: Container(
            //               padding: const EdgeInsets.symmetric(vertical: 8),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(12),
            //               ),
            //               child: CachedNetworkImage(
            //                 imageUrl: article.urlToImage ?? '',
            //                 width: double.infinity,
            //                 fit: BoxFit.cover,
            //                 height: 200,
            //                 placeholder: (context, url) =>
            //                     const Center(child: CircularProgressIndicator()),
            //                 errorWidget: (context, url, error) => Container(
            //                   color: Colors.red,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SliverToBoxAdapter(
            //         child: SizedBox(
            //           width: double.infinity,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
            //                 child: Text(
            //                   article.publishedAt ?? '',
            //                   textAlign: TextAlign.left,
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(
            //                   vertical: 16,
            //                   horizontal: 8,
            //                 ),
            //                 child: Text(
            //                   article.title ?? '',
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(
            //                     vertical: 16, horizontal: 8),
            //                 child: Text(article.content ?? ''),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(16),
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       final url = article.url;
            //       if (url != null && url.isNotEmpty) {
            //         try {
            //           // launch(url);
            //         } catch (e) {}
            //       }
            //     },
            //     child: Text('read more'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
