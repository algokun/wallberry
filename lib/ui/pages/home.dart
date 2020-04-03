import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wallberry/ui/pages/collections.dart';
import 'package:wallberry/ui/pages/dashboard.dart';
import 'package:wallberry/ui/pages/favourites.dart';

class NormalPage extends StatefulWidget {
  @override
  _NormalPageState createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Feather.grid,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
              padding: EdgeInsets.all(10.0),
            ),
          ],
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
                            icon: Icon(Feather.heart),
                            title: Text('Favourites')),
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
        Dashboard(),
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
