import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/custom_menu.dart';

class NaijaReportersRewardHistory extends StatelessWidget {

  NaijaReportersRewardHistory({Key key, this.category}): super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 24.0,),
          NaijaReportersCustomMenu(
            menuAnimationController: null,
            showMenuDrawer: null,
            category: this.category,
            details: true,
          ),

          Container(
            color: Colors.grey[200],
            height: 50.0,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(IconData(0xed1b, fontFamily: 'icofont')),
                hintText: "Search Reward History",
                hintStyle: TextStyle(
                  height: 1.6,
                ),
              ),
            ),
          ),


          Flexible(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[

                _buildRewardTile(
                  size: size,
                  image: "images/adetunji.jpg",
                  pending: true,
                  amount: "₦1,500.00",
                  duration: "2 days ago.",
                ),

                _buildRewardTile(
                  size: size,
                  image: "images/adetunji.jpg",
                  pending: true,
                  amount: "₦1,950.00",
                  duration: "3 days ago.",
                ),

                _buildRewardTile(
                  size: size,
                  image: "images/adetunji.jpg",
                  pending: false,
                  amount: "₦2,500.00",
                  duration: "4 days ago.",
                ),

                _buildRewardTile(
                  size: size,
                  image: "images/adetunji.jpg",
                  pending: false,
                  amount: "₦2,500.00",
                  duration: "5 days ago.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card _buildRewardTile({Size size, String image, bool pending, String amount, String duration}){
    Color color = Colors.blue;
    String status = "Approved";

    if (pending) {
      color = Colors.deepOrange;
      status = "Pending";
    }

    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(bottom: 30.0),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                    height: 60.0,
                    width: 70.0,
                    alignment: Alignment.center,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 26.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: Image.asset(image, fit: BoxFit.cover,),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 2.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: Image.asset(image, fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(amount, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.black54
                      ),
                      ),
                      SizedBox(height: 3.0,),
                      SizedBox(
                        width: ((size.width/2) ),
                        child: Text("Review and verification process ${status[0].toLowerCase()}${status.substring(1, status.length)}", style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black45
                        ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Remitted", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.black54
                      ),
                      ),
                      SizedBox(height: 3.0,),
                      SizedBox(
//                width: ((size.width/2) + 20),
                        child: Text(duration, style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black45
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 8.0,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Kindly be informed that your request to unlock your reward will "
                      "pass through review and verify by our Customer Relation Officer before "
                      "your bank account will be credited.", style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black45,
                  ),
                    textAlign: TextAlign.start,
                  ),

                  SizedBox(height: 8.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5.0),
                          splashColor: Colors.deepOrangeAccent,
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.only(top: 7.0, right: 15.0, left: 15.0, bottom: 7.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: color,
                              shape: BoxShape.rectangle,
                              border: Border(
                                left: BorderSide(color: color, width: 1.0, style: BorderStyle.solid),
                                top: BorderSide(color: color, width: 1.0, style: BorderStyle.solid),
                                bottom: BorderSide(color: color, width: 1.0, style: BorderStyle.solid),
                                right: BorderSide(color: color, width: 1.0, style: BorderStyle.solid),
                              ),
                            ),
                            child: Text(status, style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),


                      pending ? Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          splashColor: Colors.red,
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.only(top: 7.0, right: 15.0, left: 15.0, bottom: 7.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border(
                                left: BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.solid),
                                top: BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.solid),
                                bottom: BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.solid),
                                right: BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.solid),
                              ),
                            ),
                            child: Text("Cancel Payment Request", style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
