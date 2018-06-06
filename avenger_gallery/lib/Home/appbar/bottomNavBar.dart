import 'package:flutter/material.dart';
import 'package:avenger_gallery/Pages/firstPage.dart' as first;
import 'package:avenger_gallery/Pages/secondPage.dart' as second;
import 'package:avenger_gallery/Pages/thirdPage.dart' as third;
import 'package:avenger_gallery/Pages/fourthPage.dart' as fourth;
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => new _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin{
  final Color _tabBackgroudColor = const Color(0xFFB71C1C);

  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(
        length: 4,
        vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new Material(
        color: _tabBackgroudColor,
        child: new TabBar(
            controller: controller,

            tabs: <Tab>[
              new Tab(
                  icon: new Icon(Icons.home,
                    color: Colors.white,),
              ),
              new Tab(icon: new Icon(Icons.image,
               color: Colors.white,
               ),
              ),
              new Tab(icon: new Icon(Icons.video_library,
                color: Colors.white,),

              ),
              new Tab(icon: new Icon(Icons.store,
                     color: Colors.white,),
              ),
            ]
        ),
      ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new first.First(),
              new second.Second(),
              new third.Third(),
              new fourth.Fourth(),
            ]
        )
    );
  }
}
