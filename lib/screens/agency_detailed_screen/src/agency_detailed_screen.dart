import 'package:flutter/material.dart';

import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/color_palette.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../data/models/source.dart';

class AgencyDetailScreen extends StatelessWidget {
  const AgencyDetailScreen({
    super.key,
    required this.source,
  });

  final Source source;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Text(source.name ?? ''),
                    Text('Category: ${source.category ?? ''}'),
                    Text(source.description ?? ''),
                    TextButton(
                      onPressed: () async {
                        final url = source.url;
                        if (url != null && url.isNotEmpty) {
                          try {
                            // launch(url);
                          } catch (e) {
                            // if (kDebugMode) {
                            //   print(e);
                            // }
                          }
                        }
                      },
                      child: Text(
                        source.url ?? '',
                      ),
                    ),
                  ],
                ),
                // centerTitle: true,
                // expandedTitleScale: 2,

                // title: Text(
                //   source.name ?? '',
                //   style: context.theme.textTheme
                //       .ui16Medium(context, ColorPalette.mainBlack),
                // ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 122),
                color: ColorPalette.secondaryAccent,
                child: const Text('ITEM'),
              ),
            )
            // SliverList.builder(
            //   itemCount: state.listArticles.length,
            //   itemBuilder: (context, index) {
            //     var article = state.listArticles[index];
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => FullHotArticle(
            //                 newsArticle: article,
            //               ),
            //             ));
            //       },
            //       child: Card(
            //         child: Row(
            //           children: [
            //             Expanded(
            //               child: Padding(
            //                 padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(article.title ?? '',
            //                         style: themeBasedStyle(themeProvider,
            //                             AppStyleText.titListDetail)),
            //                     const SizedBox(
            //                       height: 8,
            //                     ),
            //                     Text(
            //                       getTextBeforeTripleDots(
            //                           article.content ?? ''),
            //                       style: themeBasedStyle(themeProvider,
            //                           AppStyleText.tcontendListDetail),
            //                       maxLines: 4,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             article.urlToImage != null
            //                 ? Expanded(
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(left: 4),
            //                       child: Image.network(
            //                         article.urlToImage!,
            //                         width: 150,
            //                         height: 150,
            //                         fit: BoxFit.fill,
            //                       ),
            //                     ),
            //                   )
            //                 : Expanded(
            //                     child:
            //                         Image.asset(AppAssets.images.nullDataUrl),
            //                   ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
