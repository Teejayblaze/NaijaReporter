import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/custom_menu.dart';

class NaijaReporterNewsCategories extends StatefulWidget {

  NaijaReporterNewsCategories({this.category, this.showMenuDrawer, this.menuAnimationController});

  final Function showMenuDrawer;
  final String category;
  final AnimationController menuAnimationController;

  @override
  _NaijaReporterNewsCategoriesState createState() => _NaijaReporterNewsCategoriesState();
}

class _NaijaReporterNewsCategoriesState extends State<NaijaReporterNewsCategories> {

  List<Map<String, dynamic>> categoryNews = new List<Map<String, dynamic>>();


  @override
  void initState() {
    super.initState();
    this.getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.0,),
          new NaijaReportersCustomMenu(
            category: this.widget.category,
            showMenuDrawer: this.widget.showMenuDrawer,
            details: true,
            menuAnimationController: this.widget.menuAnimationController,
          ),

          Container(
            height: (size.height - 78.0),
            width: size.width,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: RefreshIndicator(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: this.categoryNews.length,
                  itemBuilder: (BuildContext context, int index) =>_buildCardCategoryNews(this.categoryNews[index])
              ),
              onRefresh: this.getCategoryNews,
            ),
          ),
        ],
      ),
    );
  }


  Container _buildCardCategoryNews(Map<String, dynamic> catNews) => Container(
    height: 250.0,
    margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[

        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(catNews['imagePath'], fit: BoxFit.cover,),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            decoration: BoxDecoration(
//              backgroundBlendMode: BlendMode.colorDodge,
              color: Colors.black,
              gradient: LinearGradient(
                colors: [Colors.black26, Colors.black],
                begin: Alignment(1.0, -3.0),
                end: Alignment(1.0, 4.0),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Text(catNews['title'], style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  softWrap: true,
                ),

                Text(catNews['author'], style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                ),),

                Text(catNews['lastUpdated'], style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white70
                ),),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: -5.0,
          right: 5.0,
          child: IconButton(
             icon: Icon(Icons.bookmark_border),
             onPressed: (){},
             color: Colors.white70,
          )
        )
      ],
    ),
  );


  Future<Null> getCategoryNews() async {

    Future.delayed(Duration(seconds: 5), (){});
    this.categoryNews.addAll([
      {
        "title": "Building a Sinple Chatbot from Scratch in Python (using NLTK)",
        "imagePath": "images/portfolio_press_large.png",
        "author": "Ademola Odumosu",
        "lastUpdated": "3 hours ago"
      },
      {
        "title": "Python Implementation of Andrew Ng\'s Machine Learning Course (Part 1)",
        "imagePath": "images/wedding_akinsoto_frnd.jpg",
        "author": "Ademola Odumosu",
        "lastUpdated": "5 hours ago"
      },
      {
        "title": "Lesser Known Python Libraries for Data Science",
        "imagePath": "images/wedding-akinsoto_plus.jpg",
        "author": "Ademola Odumosu",
        "lastUpdated": "2 months ago"
      }
    ]);
    Future.value(this.categoryNews);
    return null;
  }
}
