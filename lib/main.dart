//import 'dart:js';

//import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:star_flutt/contactus.dart';
import 'package:star_flutt/gallary.dart';
import 'package:star_flutt/home.dart';
import 'package:star_flutt/login.dart';
import 'package:star_flutt/register.dart';
import 'package:star_flutt/navbar.dart';
import 'package:star_flutt/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'home': (context) => MyHome(),
      'contact': (context) => MyContactUs(),
      'gallary': (context) => MyGallary(),
      'service': (context) => MyServices(),
    },
  ));
}
