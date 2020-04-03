import 'package:flutter/material.dart';
import 'package:wallberry/setup_locator.dart';
import 'package:wallberry/ui/pages/home.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();

  runApp(MyApp());
}

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
          iconTheme: IconThemeData(color: Colors.black54)),
      home: HomePage(),
    );
  }
}
