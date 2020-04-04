import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:wallberry/ui/widgets/creation_aware_list_item.dart';
import 'package:wallberry/ui/widgets/pageview_item.dart';
import 'package:wallberry/ui/widgets/statefull_wrapper.dart';
import 'package:wallberry/viewmodels/home_viewmodel.dart';

class WallpaperPageView extends ProviderWidget<HomeViewModel> {
  final int currentIndex;

  WallpaperPageView({Key key, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return StatefulWrapper(
        beforeBuild: true,
        onInit: () {
          model.setCurrentPage(currentIndex);
        },
        child: Container(
          child: model.posts != null
              ? PageView.builder(
                  controller: model.pageController,
                  itemCount: model.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CreationAwareListItem(
                      itemCreated: () {
                        if (index % 10 == 0) {
                          model.requestMoreData();
                        }
                      },
                      child: PageViewItem(
                        wallpaper: model.posts[index],
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                  ),
                ),
        ));
  }
}
