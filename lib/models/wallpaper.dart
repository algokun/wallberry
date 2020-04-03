import 'package:cloud_firestore/cloud_firestore.dart';

class Wallpaper {
  final String collection, url, timestamp;
  final int love;
  final DocumentReference reference;

  Wallpaper.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['url'] != null),
        assert(map['loves'] != null),
        assert(map['collection'] != null),
        assert(map['timestamp'] != null),
        url = map['url'],
        timestamp = map['timestamp'],
        collection = map['collection'],
        love = map['loves'];

  Wallpaper.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Wallpaper<$collection:$url>";
}
