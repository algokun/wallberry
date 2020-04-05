import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:wallberry/ui/widgets/creation_aware_list_item.dart';
import 'package:wallberry/ui/widgets/wallpaper_item.dart';
import 'package:wallberry/viewmodels/collection_viewmodel.dart';

class CollectionGridView extends StatelessWidget {
  final String collectionName;

  CollectionGridView(this.collectionName);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CollectionViewModel>.withoutConsumer(
      onModelReady: (model) => model.listenToPosts(collectionName),
      viewModel: CollectionViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(collectionName),
        ),
        body: Container(
            child: model.posts != null
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: model.posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CreationAwareListItem(
                        itemCreated: () {
                          if (index % 10 == 0) {
                            model.requestMoreData(collectionName);
                          }
                        },
                        child: WallpaperItem(
                          wallpaper: model.posts[index],
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }
}
