import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/nr_custom_clipper.dart';
import 'package:naija_reporter/screens/news_categories.dart';
import 'package:naija_reporter/screens/user_profile.dart';
import 'package:naija_reporter/screens/user_preferences.dart';
import 'package:naija_reporter/screens/claim_reward.dart';
import 'package:naija_reporter/screens/reward_history.dart';
import 'package:naija_reporter/screens/news_publishing.dart';
import 'package:naija_reporter/models/news_category.dart';

class CustomMenuPageView extends StatelessWidget {


  CustomMenuPageView({
    this.offsetX,
    this.offsetY,
    this.headerHeight,
    this.size,
    this.showMenuDrawer,
    this.menuAnimationController,
    this.newsCategoryStream,
  });

  final double offsetX;
  final double offsetY;
  final double headerHeight;
  final Size size;
  final Function showMenuDrawer;
  final AnimationController menuAnimationController;
  final Stream<List<NaijaReportersNewsCategory>> newsCategoryStream;

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
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => NaijaReportersUserProfile()),
                      );
                    },
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
                    ),
                  ),
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

  StreamBuilder _buildListMenu(BuildContext context) =>  StreamBuilder<List<NaijaReportersNewsCategory>>(
      initialData: null,
      stream: newsCategoryStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        else if (snapshot.hasData) {

          return ListView(
              padding: EdgeInsets.only(top: 0.0),
              physics: BouncingScrollPhysics(),
              children:
              _getTopMenuList(context) +

              snapshot.data.map<ListTile>((newsCategory) => ListTile(
                key: Key("${newsCategory.id}"),
                title: Text(newsCategory.category, style: TextStyle(fontWeight: FontWeight.w600),),
                leading: Icon(IconData(newsCategory.icon, fontFamily: newsCategory.fontFamily), color: Colors.black,),
                onTap: () => this._navigate(context, newsCategory.category, null),
              )).toList()

              + _getRewardMenuList(context) + _getSettingsMenuList(context),
          );

        }
        return CircularProgressIndicator();
      }
    );

  void _navigate(BuildContext context, String category, Widget newPage) => Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => newPage == null ? new NaijaReporterNewsCategories(
            category: category,
            showMenuDrawer: this.showMenuDrawer,
            menuAnimationController: this.menuAnimationController,
          ) : newPage,
      ),
  );

  List<Widget> _getTopMenuList(BuildContext context) {
    return [
    ListTile(
        title: Text("Bookmarked News", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(IconData(0xeec0, fontFamily: 'icofont'), color: Colors.black,),
      ),
      ListTile(
        title: Text("Publish a News", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(IconData(0xebc3, fontFamily: 'icofont'), color: Colors.black,), //0xeae5
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => NaijaReportersNewsPublishing())
          );
        },
      ),
      Divider(color: Colors.black26,),
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text("News Updates"),
      ),
    ];
  }

  List<Widget> _getRewardMenuList(BuildContext context) {
    return [
      Divider(color: Colors.black26,),
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text("Rewards"),
      ),
      ListTile(
        title: Text("Claim Rewards", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(IconData(0xe972, fontFamily: 'icofont'), color: Colors.black,),
        onTap: () => this._navigate(context, null, NaijaReportersClaimReward(category: "Claim Reward",)),
      ),
      ListTile(
        title: Text("Rewards History", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(IconData(0xef46, fontFamily: 'icofont'), color: Colors.black,), //0xef37
        onTap: () => this._navigate(context, null, NaijaReportersRewardHistory(category: "Reward History",)),
      ),
    ];
  }

  List<Widget> _getSettingsMenuList(BuildContext context) {
    return [
      Divider(color: Colors.black26,),
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text("Settings"),
      ),
      ListTile(
        title: Text("Preferences", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(IconData(0xef3b, fontFamily: "icofont"), color: Colors.black,),
        onTap: () => this._navigate(context, null, NaijaReportersUserPreferences(category: "User Preferences",)),
      ),
      ListTile(
        title: Text("Logout", style: TextStyle(fontWeight: FontWeight.w600),),
        leading: Icon(IconData(0xefc4, fontFamily: "icofont"), color: Colors.black,),
      ),
    ];
  }
}
