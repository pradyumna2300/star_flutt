// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'navbar.dart';

class ContactModel {
  String name, phonenumber;
  bool isSelected;
  ContactModel(this.name, this.phonenumber, this.isSelected);
}

class MyContactUs extends StatefulWidget {
  const MyContactUs({super.key});

  @override
  State<MyContactUs> createState() => _MyContactUsState();
}

class _MyContactUsState extends State<MyContactUs> {
  List<ContactModel> contacts = [
    ContactModel("Emergency Call", "999999999", false),
    ContactModel("OPD Reception", "8888888888", false),
    ContactModel("IPD Reception", "7777777777", false),
    ContactModel("Ambulance", "666666666", false),
    ContactModel("Insurance", "555555555", false),
  ];
  List<ContactModel> selectedContacts = List.empty();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Contact Numbers"),
        backgroundColor: Color.fromARGB(255, 137, 160, 225),
      ),
      drawer: MyNavbar(),
      body: SafeArea(
          child: Container(
        child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext context, int index) {
              return ContactItem(
                  contacts[index].name,
                  contacts[index].phonenumber,
                  contacts[index].isSelected,
                  index);
            }),
      )),
    ));
  }

  Widget ContactItem(
      String name, String phoneNumber, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(phoneNumber),
      onLongPress: () {},
      trailing: isSelected
          ? Icon(
              Icons.call,
              color: Colors.green[700],
            )
          : Icon(Icons.call, color: Colors.green[700]),
      onTap: () async {
        final Uri url = Uri(
          scheme: 'tel',
          path: (phoneNumber),
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
    );
  }
}
