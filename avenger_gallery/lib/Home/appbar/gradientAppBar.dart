import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget{

  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery
              .of(context)
              .padding
              .top;

    // TODO: implement build
    return new Container(

      height: statusBarHeight + barHeight,
      padding: new EdgeInsets.only(top: statusBarHeight),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.only(
          bottomLeft: new Radius.circular(20.0),
          bottomRight: new Radius.circular(20.0)
        ),

        gradient: new LinearGradient(
            colors: [
               const Color(0xFFB71C1C),
               const Color(0xFFC62828),
            ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0,1.0],
          tileMode: TileMode.clamp


        )
      ),

      child: new Center(
        child:


        new Row(
          children: <Widget>[

            new SizedBox(width: 60.0,),
            new ImageIcon(new AssetImage("assets/images/avenger.png"), color: Colors.white,
              size: 40.0,),
            new SizedBox(width: 20.0,),
            new Text(title,

                  style: new TextStyle(

                    color: Colors.white,

                    fontFamily: 'Poppins',

                    fontWeight: FontWeight.w300,



                    fontSize: 25.0,

                  ),),
          ],
        ),


      ),
    );
  }
}