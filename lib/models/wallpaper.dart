// import 'package:cloud_firestore/cloud_firestore.dart';

// class Wallpaper {
//   final String collection, url, timestamp;
//   final int love;
//   final DocumentReference reference;

//   Wallpaper.fromMap(Map<String, dynamic> map, {this.reference})
//       : assert(map['url'] != null),
//         assert(map['loves'] != null),
//         assert(map['collection'] != null),
//         assert(map['timestamp'] != null),
//         url = map['url'],
//         timestamp = map['timestamp'],
//         collection = map['collection'],
//         love = map['loves'];

//   Wallpaper.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data, reference: snapshot.reference);

//   @override
//   String toString() => "Wallpaper<$collection:$url>";
// }

class Wallpaper {
  final String collection;
  final String url;
  final String documentId;
  final String timeStamp;
  final int loves;

  Wallpaper(
      {this.collection, this.url, this.timeStamp, this.loves, this.documentId});

  static Wallpaper fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Wallpaper(
        collection: map['collection'],
        url: map['url'],
        loves: map['loves'],
        timeStamp: map['timeStamp'],
        documentId: documentId);
  }

  static Map<String, dynamic> toMap() {
    return {
      'collection': 'Travel',
      'url':
          'https://images.pexels.com/photos/386009/pexels-photo-386009.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      'timestamp': DateTime.now().toString(),
      'loves': 2
    };
  }
}
