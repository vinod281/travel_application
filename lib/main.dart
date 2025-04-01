import 'package:flutter/material.dart';

import 'package:travel_app/NewHome.dart';

import 'package:travel_app/ViewPage.dart';

import 'package:travel_app/homePage.dart';

import 'package:travel_app/payment_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/paymentPage',
    routes: {
      '/': (context) => Home(),

      '/home':(context) => Home1(),
      

      '/viewPage':(context) => ViewPage(),

      '/paymentPage':(context) => PaymentPage(),



    },
  ));
}

