import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:photo_view/photo_view.dart';

class FullScreen extends StatelessWidget {
  final String imgPath;
  FullScreen(this.imgPath);


  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [new Color(0x10000000), new Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SizedBox.expand(
        child: new Container(
          decoration:
          new BoxDecoration(gradient: backgroundGradient),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child: new Hero(
                  tag: imgPath,
                  child: PhotoView(
                      imageProvider: NetworkImage(imgPath)),),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      leading: new IconButton(
                          icon: Icon(Icons.close,
                            color: Colors.redAccent,
                          ),
                          splashColor: Colors.yellowAccent,
                          onPressed: () => Navigator.of(context).pop()),
                    )
                  ],
                ),
              )

            ],
          ),
        ),

      ),
    floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.share, color: Colors.white,),
        onPressed: (){
          Share.share(imgPath);
        },
    backgroundColor: Colors.redAccent,),
    );


  }
}







