import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/nr_custom_clipper.dart';
import 'package:naija_reporter/screens/news_categories.dart';

class CustomMenuPageView extends StatelessWidget {


  CustomMenuPageView({
    this.offsetX,
    this.offsetY,
    this.headerHeight,
    this.size,
    this.showMenuDrawer,
    this.menuAnimationController
  });

  final double offsetX;
  final double offsetY;
  final double headerHeight;
  final Size size;
  final Function showMenuDrawer;
  final AnimationController menuAnimationController;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.diagonal3Values(offsetX, offsetY, 1.0),
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            ClipPath(
              clipper: NaijaReporterCustomClipper(),
              child: Container(
                  padding: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0, bottom: 0.0),
                  color: Colors.black87,
                  height: headerHeight,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset("images/adetunji.jpg", fit: BoxFit.cover,),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Text("Ademola Odumosu", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Colors.white,
                      ),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                      Text("odumosu.ademola@gmail.com", style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                      ),
                    ],
                  )
              ),
            ),

            Container(
              height: (size.height - headerHeight),
              child: this._buildListMenu(context),
            )
          ],
        ),
      ),
    );
  }

  ListView _buildListMenu(BuildContext context) => ListView(
    padding: EdgeInsets.only(top: 0.0),
    physics: BouncingScrollPhysics(),
    children: <Widget>[
      ListTile(
        title: Text("Bookmarked News", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.bookmark, color: Colors.black,),
      ),
      Divider(color: Colors.black26,),
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text("News Updates"),
      ),
      ListTile(
        title: Text("Politics", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.all_inclusive, color: Colors.black,),
        onTap: () => this._navigate(context, "Politics"),
      ),
      ListTile(
        title: Text("Fashion", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.wc, color: Colors.black,),
        onTap: () => this._navigate(context, "Fashion"),
      ),
      ListTile(
        title: Text("Lifestyle", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.accessibility, color: Colors.black,),
        onTap: () => this._navigate(context, "Lifestyle"),
      ),
      ListTile(
        title: Text("Sport", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.directions_run, color: Colors.black,),
        onTap: () => this._navigate(context, "Sport"),
      ),
      ListTile(
        title: Text("Entertainment", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.mic, color: Colors.black,),
        onTap: () => this._navigate(context, "Entertainment"),
      ),
      ListTile(
        title: Text("Healthy Living", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.verified_user, color: Colors.black,),
        onTap: () => this._navigate(context, "Healthy Living"),
      ),
      ListTile(
        title: Text("Society", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.transfer_within_a_station, color: Colors.black,),
        onTap: () => this._navigate(context, "Society"),
      ),
      ListTile(
        title: Text("Traveling", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.airplanemode_active, color: Colors.black,),
        onTap: () => this._navigate(context, "Traveling"),
      ),
      ListTile(
        title: Text("Dieting", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.local_dining, color: Colors.black,),
        onTap: () => this._navigate(context, "Dieting"),
      ),
      Divider(color: Colors.black26,),
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text("Settings"),
      ),
      ListTile(
        title: Text("Preferences", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.tune, color: Colors.black,),
      ),
      ListTile(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.settings, color: Colors.black,),
      ),
      ListTile(
        title: Text("Logout", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(Icons.power_settings_new, color: Colors.black,),
      ),
    ],
  );



  void _navigate(BuildContext context, String category) => Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => new NaijaReporterNewsCategories(
            category: category,
            showMenuDrawer: this.showMenuDrawer,
            menuAnimationController: this.menuAnimationController,
          ),
      ),
  );
}
