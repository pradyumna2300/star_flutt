//import 'dart:js';

//import 'dart:js';

//import 'dart:js';



import 'package:flutter/material.dart';
import 'package:star_flutt/booking.dart';
import 'package:star_flutt/contactus.dart';
import 'package:star_flutt/doct.dart';
import 'package:star_flutt/gallary.dart';
import 'package:star_flutt/home.dart';
import 'package:star_flutt/login.dart';
import 'package:star_flutt/register.dart';
import 'package:star_flutt/navbar.dart';
import 'package:star_flutt/services.dart';
import 'package:star_flutt/pro.dart';
import 'package:star_flutt/bottomnavbar.dart';
import 'package:star_flutt/doctorslist.dart';
import 'package:star_flutt/myprofile.dart';

void main() {
  runApp(MaterialApp(
    //home: MyBottomBar(),
    debugShowCheckedModeBanner: false,
   initialRoute: 'login',
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'home': (context) => MyBottomBar(),
      'contact': (context) => MyContactUs(),
      'gallary': (context) => MyGallary(),
      'service': (context) => MyServices(),
      'booking': (context) => MyBooking(),
      'pro':(context) => SettingsUI(),
      'doctorlist':(context) => MyDoctorList(),
      'myprofile':(context) => UserrofilePage(),
      'doct':(context)=> DoctList()
    },
  ));
}
