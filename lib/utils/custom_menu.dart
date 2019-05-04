import 'package:flutter/material.dart';

class NaijaReportersCustomMenu extends StatelessWidget {

  NaijaReportersCustomMenu({this.details, this.menuAnimationController, this.showMenuDrawer, this.category = ""});

  final bool details;
  final String category;
  final Function showMenuDrawer;
  final AnimationController menuAnimationController;

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }


  Row _buildAppBar(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

//    show back arrow on the menu when we are on details page
//    if not show the menu icon.
      details ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.of(context).pop();}
      )
      : IconButton(
        onPressed: showMenuDrawer,
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: menuAnimationController.view,
        ),
      ),

      details ? _createTitle() : Container(),

      Stack(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black,),
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
        ),
      ),
      SizedBox(height: 3.0,),
      Text(this.category, style: TextStyle(fontWeight: FontWeight.w600),),
    ],
  );
}
