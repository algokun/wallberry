import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:wallberry/models/wallpaper.dart';

class FirestoreService {
  final CollectionReference _imagesRef =
      Firestore.instance.collection('images');

  final StreamController<List<Wallpaper>> _postsController =
      StreamController<List<Wallpaper>>.broadcast();

  DocumentSnapshot _lastDocument;

  List<List<Wallpaper>> _allPagedResults = List<List<Wallpaper>>();

  bool _hasMorePosts = true;

  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot = await _imagesRef.getDocuments();
      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map((snapshot) =>
                Wallpaper.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.url != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTime() {
    // Register the handler for when the posts data changes
    _requestPosts();
    return _postsController.stream;
  }

  void _requestPosts() {
    var pagePostsQuery = _imagesRef.orderBy('timestamp').limit(20);

    if (_lastDocument != null) {
      pagePostsQuery = pagePostsQuery.startAfterDocument(_lastDocument);
    }

    if (!_hasMorePosts) return;

    var currentRequestIndex = _allPagedResults.length;

    pagePostsQuery.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) =>
                Wallpaper.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.url != null)
            .toList();

        var pageExists = currentRequestIndex < _allPagedResults.length;

        if (pageExists) {
          _allPagedResults[currentRequestIndex] = posts;
        } else {
          _allPagedResults.add(posts);
        }

        var allPosts = _allPagedResults.fold<List<Wallpaper>>(List<Wallpaper>(),
            (initialValue, pageItems) => initialValue..addAll(pageItems));

        // Add the posts onto the controller
        _postsController.add(allPosts);

        if (currentRequestIndex == _allPagedResults.length - 1) {
          _lastDocument = postsSnapshot.documents.last;
        }

        _hasMorePosts = posts.length == 20;
      }
    });
  }

  void requestMoreData() => _requestPosts();
}
