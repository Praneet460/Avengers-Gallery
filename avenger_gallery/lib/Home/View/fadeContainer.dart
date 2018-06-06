import 'package:flutter/material.dart';
import 'package:avenger_gallery/modal/avengers_data.dart';
import 'package:async/async.dart';
class FadeContainer extends StatefulWidget {

const FadeContainer ({Key key}) : super(key: key);

  @override
  _FadeContainerState createState() => new _FadeContainerState();
}

class _FadeContainerState extends State<FadeContainer> {

  Widget IconBuilder(BuildContext context, int index){
    return new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Padding(padding: new EdgeInsets.all(8.0)),
        new ImageIcon(new AssetImage(avenger[index].icon)),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,

      height: 50.0,
      child: new Stack(
        children: <Widget>[
          new ListView.builder(
              itemCount: avenger.length,
              itemExtent: 50.0,
              itemBuilder: IconBuilder,
              scrollDirection: Axis.horizontal,
              )
        ],

      ),




    

    );
  }
}
