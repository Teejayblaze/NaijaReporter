import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/custom_menu.dart';
import 'package:naija_reporter/utils/similar_news_details.dart';
import 'package:naija_reporter/models/news.dart';

class NaijaReportersNewsDetails extends StatefulWidget {

  NaijaReportersNewsDetails({
    this.heroTag,
    this.news,
  });

  final String heroTag;
  final NaijaReportersNews news;

  @override
  _NaijaReportersNewsDetailsState createState() => _NaijaReportersNewsDetailsState();
}

class _NaijaReportersNewsDetailsState extends State<NaijaReportersNewsDetails>  with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
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
              category: this.widget.news.category,
            ),
          ),
          Container(
            height: (size.height - 77),
            child: ListView(
              padding: EdgeInsets.only(top: 0.0),
              children: <Widget>[

                _buildNewsBody(),

                SizedBox(height: 30.0,),

                this.widget.news.author != null ?
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("News Author", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                  ),
                ): Text(""),

                SizedBox(height: 10.0,),
                this.widget.news.author != null ?
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: _buildNewsAuthor(),
                ) : Row(),
                Divider(height: 40.0,),
//                Build Author section of the widget
              ] + this._buildSimilarWidget(),
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
              child: Image.network(this.widget.news.imagePath, fit: BoxFit.cover,),
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(this.widget.news.title, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(this.widget.news.subtitle),
        ),
        SizedBox(height: 20.0,),
      ],
    ),
  );


  Row _buildNewsAuthor() => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Flexible(
        flex: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200.0),
          child: SizedBox(
            width: 60.0,
            height: 60.0,
            child: Image.network(this.widget.news.author.imagePath, fit: BoxFit.cover,),
          ),
        ),
      ),
      SizedBox(width: 10.0,),
      Expanded(
        flex: 2,
        child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.widget.news.author.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),),
                Text(this.widget.news.author.description),
              ],
            )
        ),
      ),
      SizedBox(width: 10.0,),
      InkWell(
        borderRadius: BorderRadius.circular(5.0),
        splashColor: Colors.black87,
        onTap: (){},
        child: Container(
          alignment: Alignment.centerRight,
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
      ),
    ],
  );


  List<Widget> _buildSimilarWidget() {
    if (this.widget.news.similarity != null) {
      return <Widget>
        [
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
        ] + this.widget.news.similarity.map((e) => new NaijaReporterSimilarNewsDetails(
            title: e.title,
            imagePath: e.imagePath,
            author: e.authorName,
            usefulInfo: e.duration,
          ),
        ).toList();
    }
    return [SizedBox()];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
