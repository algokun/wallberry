import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:wallberry/ui/widgets/creation_aware_list_item.dart';
import 'package:wallberry/viewmodels/home_viewmodel.dart';

class WallpaperPageView extends StatelessWidget {
  final PageController pageController;
  const WallpaperPageView({Key key, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.listenToPosts(),
        builder: (context, model, child) => Container(
            child: model.posts != null
                ? PageView.builder(
                    controller: pageController,
                    itemCount: model.posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CreationAwareListItem(
                        itemCreated: () {
                          if (index % 20 == 0) {
                            model.requestMoreData();
                          }
                        },
                        child: Image.network(model.posts[index].url),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                    ),
                  )));
  }
}
