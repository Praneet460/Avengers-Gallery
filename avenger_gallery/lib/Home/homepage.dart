import 'package:flutter/material.dart';
import 'package:avenger_gallery/Home/appbar/gradientAppBar.dart';
import 'package:avenger_gallery/Home/contentpage.dart';
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Avengers Gallery"),
          new ContentPage(),
        ],
      ),
    );
  }
}