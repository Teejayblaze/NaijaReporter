import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naija_reporter/blocs/nr_app_provider.dart';
import 'package:naija_reporter/screens/home.dart';

 class NaijaReportersAppEntry extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle.dark.copyWith(
         statusBarColor: Colors.white
       ),
     );
     return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: "Naija Reporters",
         theme: ThemeData(
           brightness: Brightness.light,
         ),
         home: Semantics(
           child: NaijaReportersAppProvider(child: NaijaReportersHome()),
         ),
     );
   }
 }
