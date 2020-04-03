import 'package:flutter/material.dart';
import 'package:wallberry/ui/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallberry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ApercuPro',
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.lightBlueAccent,
        iconTheme: IconThemeData(color: Colors.black54)
      ),
      home: NormalPage(),
    );
  }
}
