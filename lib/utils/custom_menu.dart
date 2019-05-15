import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NaijaReportersCustomMenu extends StatelessWidget {

  NaijaReportersCustomMenu({
    this.details,
    this.menuAnimationController,
    this.showMenuDrawer,
    this.category = "",
    this.invert = false,
  });

  final bool details;
  final String category;
  final Function showMenuDrawer;
  final AnimationController menuAnimationController;
  final bool invert;
  final appBarColors = [Colors.white, Colors.black87];

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: this.invert ? appBarColors[1] : Colors.white,
        statusBarIconBrightness: this.invert ? Brightness.light : Brightness.dark,
      ),
    );

    return Container(
      color: ! this.invert ? appBarColors[0] : appBarColors[1],
      child: _buildAppBar(context),
    );
  }

  Row _buildAppBar(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

//    show back arrow on the menu when we are on details page
//    if not show the menu icon.
      this.details ? IconButton(
          icon: Icon(Icons.arrow_back, color: ! this.invert ? appBarColors[1] : appBarColors[0],),
          onPressed: (){Navigator.of(context).pop();}
      )
      : IconButton(
        onPressed: this.showMenuDrawer,
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: this.menuAnimationController.view,
          color: ! this.invert ? appBarColors[1] : appBarColors[0],
        ),
      ),

      this.details ? _createTitle() : Container(),

      Stack(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications, color: ! this.invert ? appBarColors[1] : appBarColors[0],),
              onPressed: (){}
          ),
          Positioned(
            top: 0,
            right: 6,
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.pink,
              ),
              child: Text("20", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );

  Column _createTitle() => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[

      Text("Naija Reporters",
        style: TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold,
            color: ! this.invert ? appBarColors[1] : appBarColors[0]
        ),
      ),
      SizedBox(height: 3.0,),
      Text(
        this.category, style: TextStyle(
          fontWeight: FontWeight.w600,
          color: ! this.invert ? appBarColors[1] : appBarColors[0]
        ),
      ),
    ],
  );
}
