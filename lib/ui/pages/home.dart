import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wallberry/ui/pages/collections.dart';
import 'package:wallberry/ui/pages/favourites.dart';
import 'package:wallberry/ui/pages/wallpapers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text("Wallberry."),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: buildPageView(),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                child: Material(
                  color: Colors.black38,
                  clipBehavior: Clip.antiAlias,
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: BottomNavigationBar(
                      onTap: (index) {
                        bottomTapped(index);
                      },
                      currentIndex: currentIndex,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Feather.home), title: Text('Home')),
                        BottomNavigationBarItem(
                            icon: Icon(Feather.image),
                            title: Text('Collections')),
                        BottomNavigationBarItem(
                            icon: Icon(Feather.more_horizontal),
                            title: Text('About')),
                      ]),
                ),
              ),
            ),
          ],
        ));
  }

  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget buildPageView() {
    return IndexedStack(
      index: currentIndex,
      children: <Widget>[
        WallpaperGrid(),
        Collections(),
        Favourites(),
      ],
    );
  }

  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
