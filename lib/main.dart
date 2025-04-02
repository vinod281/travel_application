import 'package:flutter/material.dart';
import 'package:travel_app/ViewPage.dart';
import 'package:travel_app/homePage.dart';
import 'package:travel_app/signUpPage.dart';
import 'package:travel_app/welcomePage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/register',
    routes: {
      '/': (context) => Home(),
      '/viewPage':(context) => ViewPage(),
      '/welcome' : (context) => SignUp(),
      '/register':(context) => Register(),
      
      
    },
  ));
}

