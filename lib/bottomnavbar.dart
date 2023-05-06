import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/pro.dart';
//import 'package:clinovation/viewappointment.dart';
import 'package:star_flutt/home.dart';
import 'package:star_flutt/services.dart';


class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  List pages=[
    MyHome(),
    SettingsUI(),
    MyServices()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex=index;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Color(0xFf7165D6),
         selectedFontSize:18.0,
   unselectedFontSize : 12.0,
        onTap: onTap,
        currentIndex: currentIndex,
        items:<BottomNavigationBarItem> 
      [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.info),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda),label: "services")

      ],
      
      
      ),

    );
  }
}