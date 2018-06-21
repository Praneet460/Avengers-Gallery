import 'package:avenger_gallery/Home/View/secondPage/full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:avenger_gallery/modal/gallery.dart';
class Gallery extends StatefulWidget {
  Gallery({Key key}): super(key:key);
  @override
  _GalleryState createState() => new _GalleryState();
}




class _GalleryState extends State<Gallery> {




  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: new Container(
          color: Colors.transparent,

          child: StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 4,
              itemCount: gallery.length,
              itemBuilder: (context, int index){
                String imgPath = gallery[index].image;
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
                            image: NetworkImage(gallery[index].image),
                        fit: BoxFit.cover,)),
                  ),
                );
              },
              staggeredTileBuilder: (index) =>
          StaggeredTile.count(2, index.isEven?2:3),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,)
        ));
  }
}


