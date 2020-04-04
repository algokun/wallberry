import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wallberry/models/wallpaper.dart';

class WallpaperItem extends StatelessWidget {
  final WallpaperModel wallpaper;

  const WallpaperItem({Key key, this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 0.0, style: BorderStyle.none)),
      clipBehavior: Clip.antiAlias,
      child: FadeInImage.memoryNetwork(
        fit: BoxFit.cover,
        image: wallpaper.url,
        placeholder: kTransparentImage,
      ),
    );
  }
}
