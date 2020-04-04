import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wallberry/models/wallpaper.dart';

class PageViewItem extends StatelessWidget {
  final WallpaperModel wallpaper;

  const PageViewItem({Key key, this.wallpaper}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: wallpaper.url),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
                icon: Icon(Feather.arrow_left_circle),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: Colors.black26,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
              child: Container(
                child: ButtonBar(
                  children: <Widget>[
                    IconButton(
                      color: Colors.white,
                      icon: Icon(FontAwesome.paint_brush),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
