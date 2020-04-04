import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:wallberry/ui/widgets/creation_aware_list_item.dart';
import 'package:wallberry/ui/widgets/pageview_item.dart';
import 'package:wallberry/viewmodels/home_viewmodel.dart';

class WallpaperPageView extends ProviderWidget<HomeViewModel> {
  final int currentIndex;

  WallpaperPageView({Key key, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return StatefulWrapper(
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
                        if (index % 20 == 0) {
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

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({@required this.onInit, @required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => widget.onInit());
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
