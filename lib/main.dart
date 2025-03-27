import 'package:flutter/material.dart';
import 'package:travel_app/ViewPage.dart';
import 'package:travel_app/homePage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/viewPage',
    routes: {
      '/': (context) => Home(),
      '/viewPage':(context) => ViewPage()
    },
  ));
}

