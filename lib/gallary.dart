// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'navbar.dart';

class MyGallary extends StatelessWidget {
  const MyGallary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gallary"),
          backgroundColor: Color.fromARGB(255, 137, 160, 225),
        ),
        drawer: MyNavbar(),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Text(
                "Clinovation",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 50, right: 50),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Image.asset(
                "./assets/1.jpg",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 50, right: 50),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Image.asset("./assets/2.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Image.asset("./assets/3.jpg"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Image.asset("./assets/4.jpg"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Image.asset("./assets/5.jpg"),
            )
          ],
        )));
  }
}
