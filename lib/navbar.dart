import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/bills/opd/visitlistopdbill.dart';
import 'package:star_flutt/booking.dart';
import 'package:star_flutt/contactus.dart';
import 'package:star_flutt/doctorslist.dart';
import 'package:star_flutt/gallary.dart';
import 'package:star_flutt/home.dart';
import 'package:star_flutt/login.dart';
import 'package:star_flutt/reports.dart';
import 'package:star_flutt/services.dart';
import 'package:star_flutt/bottomnavbar.dart';
import 'package:star_flutt/pro.dart';
import 'package:star_flutt/myprofile.dart';
import 'package:star_flutt/doct.dart';
import 'package:star_flutt/viewappointment.dart';
import 'package:star_flutt/visitlistadmission.dart';
import 'package:star_flutt/visitlistdischargesummery.dart';
//import 'package:star_flutt/gallary.dart';
import 'package:star_flutt/visitlistforprescription.dart';
import 'package:star_flutt/visitlistotnotes.dart';
import 'package:star_flutt/visitlistradiology.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          onDetailsPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SettingsUI()))//UserrofilePage()))
            
          },
          accountName: const Text('UserName'),
          accountEmail: const Text('user@gmail.com'),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/doctor.png'))),
          decoration: BoxDecoration(color:  Color(0xFf7165D6)),
          
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyBottomBar()));
          },
        ),
        ListTile(
          leading: Icon(Icons.book_online),
          title: Text('BookAppointment'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyBooking()));
          },
        ),
        ListTile(
          leading: Icon(Icons.book_online),
          title: Text('BookAppointment'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyDoctorList()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('ViewAppointment'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScheduleScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Reports'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyReports()));
          },
        ),//MyVisitListPrescription
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Prescription'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyVisitListPrescription()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Radiology'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyVisitListRadiology()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Doctors List'),
          onTap: () {Navigator.push(
                context, MaterialPageRoute(builder: (context) => DoctList()));},
        ),
        ListTile(
            leading: Icon(Icons.contact_emergency),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyContactUs()));
            }),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Services'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyServices()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Gallary'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyGallary()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('OTnotes'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyVisitlistOtNotes()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Gallary'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyGallary()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Admission Form'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyVisitlistAdmission()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('Dischargesummery'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyVisitListDischargeSummery()));
          },
        ),
        ListTile(
          leading: Icon(Icons.view_agenda),
          title: Text('OPD BILL'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyVisitlistOpdBill()));
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
