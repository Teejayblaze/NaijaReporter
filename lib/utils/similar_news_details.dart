import 'package:flutter/material.dart';

class NaijaReporterSimilarNewsDetails extends StatelessWidget {

  NaijaReporterSimilarNewsDetails({
    this.title,
    this.imagePath,
    this.author,
    this.usefulInfo,
  });

  final String title;
  final String imagePath;
  final String author;
  final String usefulInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Container(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Text(this.title, style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: Image.network(this.imagePath, fit: BoxFit.cover,),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(this.author, style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 5.0,),
                      Text(this.usefulInfo, style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        fontSize: 12.0,
                      ),),
                    ],
                  ),

                  IconButton(
                      icon: Icon(IconData(0xeec0, fontFamily: 'icofont')),
                      onPressed: (){}
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 20.0,),
      ],
    );
  }
}
