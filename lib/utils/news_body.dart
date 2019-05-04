import 'package:flutter/material.dart';
import 'package:naija_reporter/screens/news_details.dart';
import 'package:naija_reporter/models/news.dart';

class NaijaReportersNewsBody extends StatelessWidget {

  NaijaReportersNewsBody({this.news, this.showModalSheet});

  final NaijaReportersNews news;
  VoidCallback showModalSheet;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.0, .1),
            end: Alignment(1.0, 1.0),
            colors: [
              Colors.white,
              this.news.bgColor
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(this.news.category, style:
                      TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0
                      ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(icon: Icon(Icons.more_vert), onPressed: (){
                    this.showModalSheet();
                  }),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(bottom: 18.0, left: 14.0, right: 14.0,),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 0.1),
                    spreadRadius: .3,
                    blurRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => NaijaReportersNewsDetails(
                          heroTag: "${this.news.id}-news",
                          imagePath: this.news.imagePath,
                          title: this.news.title,
                          subTitle: this.news.subtitle,
                          category: this.news.category,
                        )),
                      );
                    },
                    child: Hero(
                      tag: "${this.news.id}-news",
                      child: ClipRRect(
                        child: Container(
                          child: Image.asset(this.news.imagePath,
                            fit: BoxFit.cover,
                          ),
                          height: 180.0,
                          width: size.width,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(this.news.title, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(this.news.subtitle, style: textTheme.body1,),
                        SizedBox(height: 15.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(this.news.duration),

//                          Bookmarked Icon on the HomeScreen.
                            IconButton(
                              padding: EdgeInsets.all(3.0),
                              icon: Icon(Icons.bookmark_border),
                              onPressed: (){}
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            this.news.similarity != null ? _buildSimilarPages(size, this.news.similarity): Container(),
          ],
        ),
    );
  }

  Container _buildSimilarPages(Size size, similar) => Container(
    height: 120.0,
    color: Colors.transparent,
    child: PageView.builder(
        itemCount: similar.length,
        controller: PageController(viewportFraction: .92),
        itemBuilder: (BuildContext context, int index){
          double mRight = 10.0;
          if ((similar.length-1) == index) mRight = 0.0;
          return Container(
            margin: EdgeInsets.only(right: mRight),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Similar News", style: TextStyle(
                  color: Colors.black54
                ),),
                SizedBox(height: 6.0,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(similar[index].title,
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: SizedBox(
                            width: 60.0,
                            height: 60.0,
                            child: Image.asset(similar[index].imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ) ,
                    )
                  ],
                )
              ],
            ),
          );
        }
    ),
  );
}
