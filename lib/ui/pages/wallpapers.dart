import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            ? StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                itemCount: model.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return CreationAwareListItem(
                    itemCreated: () {
                      if (index % 20 == 0) {
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
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                ),
              ));
  }
}
