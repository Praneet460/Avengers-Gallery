import 'package:flutter/material.dart';
import 'package:avenger_gallery/modal/avengers_data.dart';
import 'package:flutter_test/flutter_test.dart';


class ContentPage extends StatelessWidget{
  const ContentPage({Key key}) : super(key: key);







  Widget dialogBuilder(BuildContext context, Avenger avenger){


    return new SimpleDialog(
      contentPadding: EdgeInsets.zero,



      children: [
           new Material(
             borderRadius: new BorderRadius.only(
                 bottomRight: new Radius.circular(15.0),
                 bottomLeft: new Radius.circular(15.0)),
             child:  FadeInImage(

               image: new NetworkImage(avenger.image),
               fit: BoxFit.cover,
               placeholder: new AssetImage("assets/images/marvel.jpg"),
             ),
           ),




          new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  new Row(
                    children: <Widget>[
                      new Text("Avenger:",
                       style: new TextStyle(
                         fontFamily: 'Poppins',
                         fontWeight: FontWeight.w300,
                         fontSize: 15.0,
                       ),),
                      new SizedBox(width: 5.0,),
                      new Text(avenger.avengerName,
                       style: new TextStyle(
                         fontFamily: 'Comfortaa',
                         fontSize: 15.0,
                       ),),

                    ],
                  ),
                  new SizedBox(height: 16.0,),
                  new Text(avenger.moviename,
                  style: new TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                  ),),


                  new SizedBox(height: 16.0,),

                  new Align(
                    alignment: Alignment.centerRight,
                    child: new Wrap(
                      children: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: new Text('Dismiss',
                                 style: new TextStyle(
                                   fontFamily: 'Comfortaa',
                                   fontWeight: FontWeight.w800,
                                 ),
                            ),
                            splashColor: Colors.yellowAccent,),
                        new SizedBox(width: 10.0,),
                        new RaisedButton(
                            onPressed: () {},
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

                                new Text('Like',
                                   style: new TextStyle(
                                     fontFamily: 'Comfortaa',
                                     fontWeight: FontWeight.w800,
                                     color: Colors.white
                                   ),),
                              ],
                            ),
                            color: Colors.blueAccent,
                            splashColor: Colors.yellowAccent,

                            shape: const StadiumBorder(),
                        )
                      ],
                    ),
                  )


                ],
              ),)
      ]
    );

  }

  Widget listItemBuilder(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () => showDialog(
          context: context,
          child:
              dialogBuilder(context, avenger[index])),
      child: new Container(
          padding: const EdgeInsets.only(left: 5.0),
          alignment: Alignment.centerLeft,

          child: new ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Image(image: new AssetImage(avenger[index].icon,),),
            ),
            title: new Text(avenger[index].avengerName,
                         style: const TextStyle(
                           color: Colors.black,
                           fontFamily: 'Comfortaa',
                           fontWeight: FontWeight.w600,
                           fontSize: 25.0

                         ),),
            subtitle: new Text(avenger[index].actorName ?? "unknown ...",
                          style: const TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300
                          ),),

            ),
          ),
    );
    

  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Expanded(
      child: new Container(
        color: Colors.transparent,



        child: RefreshIndicator( // used to indicate refresh indicator
          onRefresh: () async{
            await new Future.delayed(const Duration(seconds: 1));
          },
          child: new ListView.builder(
              itemCount: avenger.length,
              itemExtent: 70.0,
              itemBuilder: listItemBuilder,



      ),
        ),
      ),
    );

    
  }
}