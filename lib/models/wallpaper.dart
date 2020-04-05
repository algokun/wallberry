class WallpaperModel {
  final String collection;
  final String url;
  final String thumburl;
  final String documentId;
  final String timeStamp;
  final int loves;

  WallpaperModel(
      {this.collection,
      this.url,
      this.timeStamp,
      this.loves,
      this.documentId,
      this.thumburl});

  static WallpaperModel fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return WallpaperModel(
        collection: map['collection'],
        url: map['url'],
        thumburl: map['thumburl'],
        loves: map['loves'],
        timeStamp: map['timeStamp'],
        documentId: documentId);
  }
}
