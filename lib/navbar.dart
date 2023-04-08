import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
          onTap: () => print('home'),
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
          onTap: () => print('callus'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('LogOut'),
          onTap: () => print('ViewAppointment'),
        ),
      ],
    ));
  }
}
