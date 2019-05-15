import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naija_reporter/blocs/nr_app_provider.dart';
import 'package:naija_reporter/screens/home.dart';

 class NaijaReportersAppEntry extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: "Naija Reporters",
         theme: ThemeData(
           brightness: Brightness.light,
           primaryColor: Colors.black,
           accentColor: Colors.white,
         ),
         home: Semantics(
           child: NaijaReportersAppProvider(child: NaijaReportersHome()),
         ),
     );
   }
 }
