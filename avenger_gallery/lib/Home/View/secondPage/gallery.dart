import 'dart:convert';
import 'dart:async';
import 'package:avenger_gallery/Home/View/secondPage/full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:http/http.dart' as http;
class Gallery extends StatefulWidget {
  Gallery({Key key}): super(key:key);
  @override
  _GalleryState createState() => new _GalleryState();
}




class _GalleryState extends State<Gallery> {

  List data;
  var _isLoading = true;
  Future<String> getData() async{
    print("Attempting to fetch data from network");
    var response = await http.get(
        Uri.encodeFull("https://my-json-server.typicode.com/Praneet460/JSON_SERVER/img"),
        headers:{
          "Accept": "application/json"

        }
    );
    this.setState((){



      if (response.statusCode == 200) {
        data = JSON.decode(response.body);
        setState(() {
          _isLoading = false;
        });

        }

    });

    return "Successful!";
    }


  @override
  void initState() {
    // TODO: implement initState

    this.getData();



  }




  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: new Container(
          color: Colors.transparent,

          child: _isLoading ? Center(child: CircularProgressIndicator(),):
          RefreshIndicator(
            child: StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(10.0),
                crossAxisCount: 4,
                itemCount: data== null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index){
                  String imgPath = data[index]["imgURL"];
                  return new Material(
                    elevation: 4.0,
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                    child: new GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) => new FullScreen(imgPath))),
                      child: new Hero(
                          tag: imgPath,
                          child: FadeInImage(
                              placeholder: new AssetImage("assets/images/avenger.png"),
                              image: NetworkImage(data[index]["imgURL"]),
                          fit: BoxFit.cover,)),
                    ),
                  );

                },

                staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven?2:3),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,),
            onRefresh: () async{
              setState(() {
                getData();
              });
            }


          )

        ));
  }
}


