import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Wallberry\n',
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.lightBlue)),
            TextSpan(
                text:
                    "\nWallberry is being created to provide a new experience in wallpaper application. \nIt follows modern design and it is easy to use but never compromises on quality of the wallpaper. The Whole Application is build with Flutter and Firebase.\n \n",
                style: Theme.of(context).textTheme.subhead),
          ])),
          Text(
            "Developer\n",
            style: Theme.of(context).textTheme.title,
          ),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/images/author.jpg"),
          ),
          Text(
            "\n Mohan Talupula aka Algokun \n UI/UX Enthusiast | Android | Web ",
            style: Theme.of(context).textTheme.subhead,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Feather.twitter,
                    color: Colors.lightBlue,
                  ),
                  onPressed: () {
                    _launchURL("https://www.twitter.com/algokun");
                  }),
              IconButton(
                  icon: Icon(Feather.github, color: Colors.lightBlue),
                  onPressed: () {
                    _launchURL("https://www.github.com/algokun");
                  }),
              IconButton(
                  icon: Icon(
                    Feather.linkedin,
                    color: Colors.lightBlue,
                  ),
                  onPressed: () {
                    _launchURL("https://www.twitter.com/algokun");
                  }),
            ],
          ),
          FlatButton(
              onPressed: () {
                _launchURL("https://github.com/algokun/wallberry");
              },
              child: Text("Open Sourced on Github"))
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
