import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/custom_menu.dart';

class NaijaReportersUserProfile extends StatefulWidget {
  @override
  _NaijaReportersUserProfileState createState() => _NaijaReportersUserProfileState();
}

class _NaijaReportersUserProfileState extends State<NaijaReportersUserProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 24.0,),
            NaijaReportersCustomMenu(
              menuAnimationController: null,
              showMenuDrawer: null,
              category: 'User Profile',
              details: true,
              invert: true,
            ),
            _buildUserHeaderPanel(size),
            _buildBodyProfile(size),
          ],
        ),
      ),
    );
  }


  Container _buildUserHeaderPanel(Size size) => Container(
    height: 120,
    color: Colors.black87,
    width: double.infinity,
    child: Stack(
      overflow: Overflow.visible,
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: 30.0,
          left: 20.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Image.asset("images/adetunji.jpg", fit: BoxFit.cover,), // Coin Image
                ),
              ),
              SizedBox(height: 5.0,),
              Text("₦1,500.00", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 2.0,),
              Text("Total Reward Incurred", style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: -40.0,
          left: ((size.width/2) - 50),
          child: Container(
            height: 100.0,
            width: 100.0,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: Colors.white, style: BorderStyle.solid, width: 2.0),
                bottom: BorderSide(color: Colors.white, style: BorderStyle.solid, width: 2.0),
                right: BorderSide(color: Colors.white, style: BorderStyle.solid, width: 2.0),
                top: BorderSide(color: Colors.white, style: BorderStyle.solid, width: 2.0),
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: Image.asset("images/adetunji.jpg", fit: BoxFit.cover,),
              ),
            ),
          ),
        ),

        Positioned(
          right: 20.0,
          top: 30.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    color: Colors.white,
                    child: Icon(IconData(0xeded, fontFamily: 'icofont'), color: Colors.black87,),
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Text("Edit Profile", style: TextStyle(color: Colors.white),)
            ],
          )
        ),
      ],
    ),
  );

  Container _buildBodyProfile(Size size) => Container(
    height: (size.height - 192),
    color: Colors.transparent,
    padding: EdgeInsets.only(top: 42.0),
    child: ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 0.0),
      children: <Widget>[

        Divider(color: Colors.black26,),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text("Personal Details"),
        ),

        _createListTile(text: "Awobajo", label: "Lastname", icon: IconData(0xed0a, fontFamily: 'icofont')),
        _createListTile(text: "Adetunji", label: "Firstname", icon: IconData(0xecf8, fontFamily: 'icofont')),
        _createListTile(text: "surfsamson@gmail.com", label: "Email Address", icon: IconData(0xef63, fontFamily: 'icofont')),
        _createListTile(text: "+234808 474 5205", label: "Phone Number", icon: IconData(0xefec, fontFamily: 'icofont')),

        Divider(color: Colors.black26,),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text("Account Details"),
        ),

        _createListTile(text: "Awobajo Adetunji Sunday", label: "Account Name", icon: IconData(0xed0f, fontFamily: 'icofont')),
        _createListTile(text: "2083442421", label: "Account Number", icon: IconData(0xefad, fontFamily: 'icofont')),
        _createListTile(text: "United Bank of Africa", label: "Bank Name", icon: IconData(0xe961, fontFamily: 'icofont')),
      ],
    ),
  );


  ListTile _createListTile({String text, String label, IconData icon}) => ListTile(
    title:  Text(text, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
      ),
    ),

    subtitle: Text(label),
    leading: Container(
      width: 40.0,
      height: 40.0,
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1.0),
          bottom: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1.0),
          right: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1.0),
          top: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1.0),
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.black,),
      ) ,
    ),
  );
}
