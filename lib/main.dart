//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:star_flutt/home.dart';
import 'package:star_flutt/login.dart';
import 'package:star_flutt/register.dart';
import 'package:star_flutt/navbar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'home': (context) => MyHome(),
    },
  ));
}
