import 'package:flutter/material.dart';
import 'package:travel_app/NewHome.dart';
import 'package:travel_app/ViewPage.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {

      '/': (context) => Home1(),
      '/home':(context) => Home1(),
      '/viewPage':(context) => ViewPage(),

    }
  ));
}

