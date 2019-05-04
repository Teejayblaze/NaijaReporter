import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/custom_menu.dart';
import 'package:naija_reporter/utils/similar_news_details.dart';

class NaijaReportersNewsDetails extends StatefulWidget {

  NaijaReportersNewsDetails({
    this.heroTag,
    this.imagePath,
    this.title,
    this.subTitle,
    this.category,
  });

  final String heroTag;
  final String imagePath;
  final String title;
  final String subTitle;
  final String category;

  @override
  _NaijaReportersNewsDetailsState createState() => _NaijaReportersNewsDetailsState();
}

class _NaijaReportersNewsDetailsState extends State<NaijaReportersNewsDetails>  with SingleTickerProviderStateMixin{

  List<Map<String, dynamic>> similar = new List<Map<String, dynamic>>();

  @override
  void initState() {
    super.initState();
    this.similar.addAll([
      {
        "title": "Building a Sinple Chatbot from Scratch in Python (using NLTK)",
        "imagePath": "images/aac_campaign_3.jpg",
        "author": "Ademola Odumosu",
        "usefulInfo": "4/11/2019 - Popularly read"
      },
      {
        "title": "Python Implementation of Andrew Ng\'s Machine Learning Course (Part 1)",
        "imagePath": "images/aac_campaign_5.jpg",
        "author": "Ademola Odumosu",
        "usefulInfo": "8/20/2019 - Popularly read"
      },
      {
        "title": "Lesser Known Python Libraries for Data Science",
        "imagePath": "images/aac_campaign_2.jpg",
        "author": "Ademola Odumosu",
        "usefulInfo": "9/14/2019 - Popularly read"
      }
    ]);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 47.0,
            padding: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
            margin: EdgeInsets.only(top: 30.0),
            child: NaijaReportersCustomMenu(
              details: true,
              menuAnimationController: null,
              showMenuDrawer: null,
              category: this.widget.category,
            ),
          ),
          Container(
            height: (size.height - 77),
            child: ListView(
              padding: EdgeInsets.only(top: 0.0),
              children: <Widget>[

                _buildNewsBody(),

                SizedBox(height: 30.0,),

                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("News Author", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                  ),
                ),

                SizedBox(height: 10.0,),
                _buildNewsAuthor(),
                Divider(height: 40.0,),

                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Similar News", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black54,
                  ),
                  ),
                ),

                SizedBox(height: 10.0,),

//                Build Author section of the widget
              ] + this.similar.map((e) => new NaijaReporterSimilarNewsDetails(
                    title: e['title'],
                    imagePath: e['imagePath'],
                    author: e['author'],
                    usefulInfo: e['usefulInfo'],
                  ),
                ).toList(),
            ),
          )
        ],
      ),
    );
  }

  Container _buildNewsBody() => Container(
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: this.widget.heroTag,
          child: ClipRRect(
            child: Container(
              height: 300.0,
              child: Image.asset(this.widget.imagePath, fit: BoxFit.cover,),
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(this.widget.title, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(this.widget.subTitle),
        ),
        SizedBox(height: 20.0,),
      ],
    ),
  );


  Row _buildNewsAuthor() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Flexible(
        flex: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200.0),
          child: SizedBox(
            width: 60.0,
            height: 60.0,
            child: Image.asset("images/adetunji.jpg", fit: BoxFit.cover,),
          ),
        ),
      ),
      Flexible(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Ademola Odumosu", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),),
            Text("A Pyscologist with 3 years of human managerial skills."),
          ],
        )
      ),
      InkWell(
        borderRadius: BorderRadius.circular(5.0),
        splashColor: Colors.black87,
        onTap: (){},
        child: Container(
          padding: EdgeInsets.only(top: 7.0, right: 15.0, left: 15.0, bottom: 7.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border(
              left: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid),
              top: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid),
              bottom: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid),
              right: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid),
            ),
          ),
          child: Text("Follow"),
        ),
      )
    ],
  );

  @override
  void dispose() {
    super.dispose();
  }
}
