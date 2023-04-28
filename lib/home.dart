import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/navbar.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      drawer: MyNavbar(),
      appBar: AppBar(
        title: const Text('Clinovation'),
        backgroundColor: Color.fromARGB(255, 3, 138, 93),
      ),
      body: const Center(child: Text("MainPage")),
    ));
  }
}
