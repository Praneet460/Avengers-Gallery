import 'package:flutter/material.dart';
import 'package:avenger_gallery/Home/appbar/gradientAppBar.dart';
import 'package:avenger_gallery/Home/contentpage.dart';
import 'package:avenger_gallery/Home/View/fadeContainer.dart';

class First extends StatefulWidget {
  First({Key key, this.title}) : super(key:key);

  final String title;
  @override
  FirstState createState() {
    return new FirstState();
  }
}

class FirstState extends State<First> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Avengers List"),
          new AnimatedOpacity(
              opacity: _visible ? 1.0 :0.0,
              duration: new Duration(milliseconds: 500),

              child: new FadeContainer()),
          new ContentPage(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {


            setState(() {

              _visible = !_visible;
            });
          },
        backgroundColor: new Color(0xFFC62828),
        child: new Icon(Icons.flip, color: Colors.white,),
        tooltip: 'Toggle Opacity',

          ),
    );
  }
}
