import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/contactus.dart';
import 'package:star_flutt/gallary.dart';
import 'package:star_flutt/home.dart';
import 'package:star_flutt/login.dart';
//import 'package:star_flutt/gallary.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text('UserName'),
          accountEmail: const Text('user@gmail.com'),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/doctor.png'))),
          decoration: BoxDecoration(color: Color.fromARGB(255, 137, 160, 225)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHome()));
          },
        ),
        ListTile(
          leading: Icon(Icons.book_online),
          title: Text('BookAppointment'),
          onTap: () => print('bookappointment'),
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('ViewAppointment'),
          onTap: () => print('ViewAppointment'),
        ),
        ListTile(
            leading: Icon(Icons.contact_emergency),
            title: Text('ContactUs'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyContactUs()));
            }),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Gallary'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyGallary()));
          },
        ),
        Divider(),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('LogOut'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyLogin()));
          },
        ),
      ],
    ));
  }
}
