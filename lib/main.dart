import 'package:flutter/material.dart';

import 'package:travel_app/NewHome.dart';

import 'package:travel_app/ViewPage.dart';

import 'package:travel_app/homePage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Home(),

      '/home':(context) => Home1(),
      

      '/viewPage':(context) => ViewPage(),

    },
  ));
}

