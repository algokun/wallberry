import 'package:flutter/material.dart';
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
        child: Image.network(
          wallpaper.thumburl,
          cacheHeight: 200,
          cacheWidth: 200,
          filterQuality: FilterQuality.medium,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, extent) {
            if (extent == null) return child;

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
