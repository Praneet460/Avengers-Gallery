import 'package:flutter/material.dart';
import 'package:avenger_gallery/modal/avengers_data.dart';
class ContentPage extends StatelessWidget{
  const ContentPage({Key key}) : super(key: key);

  Widget dialogBuilder(BuildContext context, Avenger avenger){
    return new SimpleDialog(
      contentPadding: EdgeInsets.zero,


      children: [
          new Image.network(avenger.image,
                          fit: BoxFit.fill,
          ),
          new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  new Text(avenger.avengerName),
                  new SizedBox(height: 16.0,),
                  new Text(avenger.actorName),
                  new SizedBox(height: 16.0,),

                  new Align(
                    alignment: Alignment.centerRight,
                    child: new Wrap(
                      children: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Like'),),
                        new RaisedButton(
                            onPressed: () {},
                            child: const Text('Know More'),)
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
            leading: new Image(image: new AssetImage(avenger[index].icon)),
            title: new Text(avenger[index].avengerName,
                         style: const TextStyle(
                           color: Colors.black,
                           fontFamily: 'Comfortaa',
                           fontWeight: FontWeight.w600,
                           fontSize: 25.0

                         ),),
            subtitle: new Text(avenger[index].actorName,
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
        
        child: new ListView.builder(
            itemCount: avenger.length,
            itemExtent: 70.0,
            itemBuilder: listItemBuilder,


      ),
    )
    );

    
  }
}