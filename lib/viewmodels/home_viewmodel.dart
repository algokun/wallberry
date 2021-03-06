import 'package:flutter/widgets.dart';
import 'package:wallberry/models/wallpaper.dart';
import 'package:wallberry/services/firestore_service.dart';
import 'package:wallberry/viewmodels/base_viewmodel.dart';

import '../setup_locator.dart';

class HomeViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  PageController pageController = PageController(
    initialPage: 0,
  );

  List<WallpaperModel> _posts;
  List<WallpaperModel> get posts => _posts;

  void listenToPosts() {
    setBusy(true);

    _firestoreService.listenToPostsRealTime(false, "").listen((postsData) {
      List<WallpaperModel> updatedPosts = postsData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _posts = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  void requestMoreData() => _firestoreService.requestMoreData(false, "");

  void setCurrentPage(int index) {
    pageController.jumpToPage(index);
    notifyListeners();
  }
}
