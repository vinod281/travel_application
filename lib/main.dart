import 'package:flutter/material.dart';
import 'package:travel_app/NewHome.dart';
import 'package:travel_app/TravelPlanPage.dart';
import 'package:travel_app/ViewPage.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/plan',
    routes: {

      '/': (context) => Home1(),
      '/home':(context) => Home1(),
      '/viewPage':(context) => ViewPage(),
      '/plan':(context) => TravelPlan(),

    }
  ));
}

