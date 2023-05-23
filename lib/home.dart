import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/bottomnavbar.dart';
import 'package:star_flutt/navbar.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
         /* bottomNavigationBar: FancyBottomNavigation(
    tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.shopping_cart, title: "Basket")
    ],
    onTabChangedListener: (position) {
        setState(() {
        currentPage = position;
        });
    },
),*///bottomNavigationBar: MyBottomBar(),
      drawer: MyNavbar(),
      appBar: AppBar(
        title: const Text('Clinovation'),
        backgroundColor:  Color(0xFf7165D6),
      ),
      body: const Center(child: Text("MainPage")),
    ));
  }
}
