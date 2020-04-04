import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wallberry/models/wallpaper.dart';

class WallpaperItem extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperItem({Key key, this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 0.0, style: BorderStyle.none)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: wallpaper.url,
            placeholder: kTransparentImage,
          ),
          Positioned(
            right: 5,
            child: IconButton(
              icon: Icon(Feather.heart),
              onPressed: () {
                Firestore.instance.collection('images').add(Wallpaper.toMap());
              },
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
