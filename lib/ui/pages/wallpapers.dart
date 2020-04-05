import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:wallberry/ui/pages/pageview_wallpapers.dart';
import 'package:wallberry/ui/widgets/creation_aware_list_item.dart';
import 'package:wallberry/ui/widgets/wallpaper_item.dart';
import 'package:wallberry/viewmodels/home_viewmodel.dart';

class WallpaperGrid extends ProviderWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, model) {
    return Container(
        child: model.posts != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: model.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return CreationAwareListItem(
                    itemCreated: () {
                      if (index % 10 == 0) {
                        model.requestMoreData();
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WallpaperPageView(
                                  key: ValueKey(index),
                                  currentIndex: index,
                                )));
                      },
                      child: WallpaperItem(
                        wallpaper: model.posts[index],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
