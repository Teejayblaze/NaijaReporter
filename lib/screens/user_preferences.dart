import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/custom_menu.dart';

class NaijaReportersUserPreferences extends StatefulWidget {

  NaijaReportersUserPreferences({Key key, this.category}): super(key: key);

  final String category;

  @override
  _NaijaReportersUserPreferencesState createState() => _NaijaReportersUserPreferencesState();
}

class _NaijaReportersUserPreferencesState extends State<NaijaReportersUserPreferences> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 24.0,),
            NaijaReportersCustomMenu(
              menuAnimationController: null,
              showMenuDrawer: null,
              category: this.widget.category,
              details: true,
            ),
            _buildUserPreferenceBody(size),
          ],
        ),
    );
  }



  Container _buildUserPreferenceBody(Size size) => Container(
    height: size.height - 72,
    width: size.width,
//    color: Colors.blueGrey,
    child: ListView(
      children: <Widget>[

        _createListTile(
          isLeading: false,
          isTrailing: true,
          icon: null,
          title: "Reveal Identity",
          subTitle: "Always Show your identity on all your published news on this platform."
        ),

        Divider(color: Colors.black26,),

        _createListTile(
            isLeading: false,
            isTrailing: false,
            icon: null,
            title: "Cashout Threshold",
            subTitle: "Set a cashout threshold while the app notify you when threshold elapses. Default threshold is ₦2,500.00"
        ),

        Divider(color: Colors.black26,),

        _createListTile(
            isLeading: false,
            isTrailing: true,
            icon: null,
            title: "Show Read Information",
            subTitle: "Show how many people has read my published news."
        ),

        Divider(color: Colors.black26,),

        _createListTile(
            isLeading: false,
            isTrailing: true,
            icon: null,
            title: "Payment Notification",
            subTitle: "Notify me when payment has been remitted to my account."
        ),
      ],
    ),
  );


  ListTile _createListTile({bool isLeading, bool isTrailing, IconData icon, String title, String subTitle}) => ListTile(
    leading: isLeading ? Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 2.0),
          bottom: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 2.0),
          right: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 2.0),
          top: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 2.0),
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Icon(icon),
    ) : null,
    title: Text(title, style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),
    ),
    subtitle: Text(subTitle, style: TextStyle(fontSize: 12.0),),
    trailing: isTrailing ? Switch(
      value: false,
      onChanged: (value){},
      activeColor: Colors.black,
    ) : null,
  );

}
