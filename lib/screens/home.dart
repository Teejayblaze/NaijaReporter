import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naija_reporter/models/news.dart';
import 'package:naija_reporter/utils/news_body.dart';
import 'package:naija_reporter/utils/custom_menu.dart';
import 'package:naija_reporter/animations/news_menu_animation.dart';
import 'package:naija_reporter/blocs/nr_news_stream.dart';
import 'package:naija_reporter/utils/custom_menu_pageview.dart';


class NaijaReportersHome extends StatefulWidget {
  @override
  _NaijaReportersHomeState createState() => _NaijaReportersHomeState();
}

class _NaijaReportersHomeState extends State<NaijaReportersHome> with SingleTickerProviderStateMixin {
  AnimationController _menuAnimationController;
  NaijaReportersNewsMenuSlideAnimation _naijaReportersNewsMenuSlideAnimation;

  @override
  void initState() {
    super.initState();
    this._menuAnimationController = new AnimationController(vsync: this, duration: Duration(seconds: 0));

    njReporterStreamBloc.fillStreamRepository();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this._naijaReportersNewsMenuSlideAnimation = new NaijaReportersNewsMenuSlideAnimation(controller: this._menuAnimationController, size: MediaQuery.of(context).size);
    this._naijaReportersNewsMenuSlideAnimation.translateNewsBody.addListener((){ setState(() {});});
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double headerHeight = 250.0;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          CustomMenuPageView(
            offsetX: this._naijaReportersNewsMenuSlideAnimation.revealMenuBar.value.dx,
            offsetY: this._naijaReportersNewsMenuSlideAnimation.revealMenuBar.value.dy,
            size: size,
            headerHeight: headerHeight,
            menuAnimationController: this._menuAnimationController,
            showMenuDrawer: this.showMenuDrawer,
          ),

          GestureDetector(
            onHorizontalDragStart: (dragDetails) {
              if (dragDetails.globalPosition.dx >= 20.0){
                this._menuAnimationController.reverse();
              } else if (dragDetails.globalPosition.dx <= 20){
                this._menuAnimationController.forward();
              }
            },
            child: Transform.translate(
              offset: this._naijaReportersNewsMenuSlideAnimation.translateNewsBody.value,
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(-20.0, 1.0),
                          spreadRadius: 3.0,
                          blurRadius: 10.0
                      )
                    ]
                ),
                child: RefreshIndicator(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Material(
                      elevation: 0.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 25.0, left: 3.0, right: 0.0),
                            child: NaijaReportersCustomMenu(
                              details: false,
                              menuAnimationController: this._menuAnimationController,
                              showMenuDrawer: showMenuDrawer,
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          this._buildCorporateName(size),
                          SizedBox(height: 20.0,),
                          this._buildNewsReports(),
                        ],
                      ),
                    ),
                  ),
                  onRefresh: njReporterStreamBloc.fillStreamRepository,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Column _buildCorporateName(Size size) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[

      Text("Naija Reporters", style: TextStyle(
        fontSize: 38.0, fontWeight: FontWeight.bold,
      ),),

      SizedBox(
        width: (size.width/2 + 50),
        child: Text("Get updated on recent happening "
          "news all around you and beyond.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
      ),
    ],
  );



  StreamBuilder _buildNewsReports() {
    return StreamBuilder<List<NaijaReportersNews>>(
        initialData: null,
        stream: njReporterStreamBloc.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasError) {
              return Text("An error occure: ${snapshot.error}");
            }
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: snapshot.data.map<Widget>((e) => NaijaReportersNewsBody(news: e, showModalSheet: showModalSheet,)).toList()
              );
            }
            return Container(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            );
        }
    );
  }

  void showModalSheet() {
    showModalBottomSheet(context: context, builder: (BuildContext builder) {
      return Container(
        height: 230.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          )
        ),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.share, color: Colors.black87,),
              title: Text("Share", style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            ListTile(
              leading: Icon(Icons.bookmark, color: Colors.black87,),
              title: Text("Bookmark", style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            ListTile(
              leading: Icon(Icons.thumb_up, color: Colors.black87,),
              title: Text("Like", style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            ListTile(
              leading: Icon(Icons.clear, color: Colors.black87,),
              title: Text("Close", style: TextStyle(fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      );
    });
  }

  showMenuDrawer() {
    this._menuAnimationController.fling(velocity: this.hasFlipped ? -1.0 : 1.0);
  }

  bool get hasFlipped {
    AnimationStatus status = this._menuAnimationController.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  @override
  void dispose() {
    this._menuAnimationController.dispose();
    super.dispose();
  }
}
