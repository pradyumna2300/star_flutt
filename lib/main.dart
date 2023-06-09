

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:star_flutt/admissionform.dart';
import 'package:star_flutt/bills/bill.dart';
import 'package:star_flutt/bills/opd/opdbill.dart';
import 'package:star_flutt/bills/opd/opdbilllist.dart';
import 'package:star_flutt/bills/opd/visitlistopdbill.dart';
import 'package:star_flutt/bills/visitlistbills.dart';
import 'package:star_flutt/booking.dart';
import 'package:star_flutt/contactus.dart';
import 'package:star_flutt/dischargesummery.dart';
import 'package:star_flutt/doct.dart';
import 'package:star_flutt/gallary.dart';
import 'package:star_flutt/home.dart';
import 'package:star_flutt/login.dart';
import 'package:star_flutt/logint.dart';
import 'package:star_flutt/otnotes.dart';
//import 'package:star_flutt/pathalogy.dart';
import 'package:star_flutt/prescription.dart';
import 'package:star_flutt/register.dart';
import 'package:star_flutt/navbar.dart';
import 'package:star_flutt/reportpathology.dart';
import 'package:star_flutt/services.dart';
import 'package:star_flutt/pro.dart';
import 'package:star_flutt/bottomnavbar.dart';
import 'package:star_flutt/doctorslist.dart';
import 'package:star_flutt/myprofile.dart';
import 'package:star_flutt/reports.dart';
import 'package:star_flutt/viewappointment.dart';
import 'package:star_flutt/myappointmentdetails.dart';
import 'package:star_flutt/prescriptionlist.dart';
import 'package:star_flutt/t.dart';
import 'package:star_flutt/visitlistadmission.dart';
import 'package:star_flutt/visitlistdischargesummery.dart';
import 'package:star_flutt/visitlistforprescription.dart';
import 'package:star_flutt/visitlistotnotes.dart';
import 'package:star_flutt/visitlistradiology.dart';
import 'package:star_flutt/radiologyreportslist.dart';
import 'package:star_flutt/visitlistcasepaper.dart';
import 'package:star_flutt/casepaper.dart';
import 'package:star_flutt/check.dart';
import 'package:star_flutt/bills/billlist.dart';

void main() {
  runApp(MaterialApp(
    //home: MyBottomBar(),
    debugShowCheckedModeBanner: false,
   initialRoute: 'home',
    routes: {
      'logint': (context) => Login(),
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
      'doct':(context)=> DoctList(),
      'viewappointment':(context) => ScheduleScreen(),
      'prescription':(context) => MyPrescript(),
      'myappointmentdetails':(context)=> MyAppointment(),
      //'pathalogy':(context)=>MyPatho(),
      'reportpathology':(context) => MyReportPatho(),
      'reports':(context) =>   MyReports(),
      't':(context) => MyPatho(),
      'prescriptionlist':(context) => MyPrescriptionList(),
      'visitlistforprescription':(context) => MyVisitListPrescription(),
      'visitlistradiology':(context) => MyVisitListRadiology(),
      'radiologyreportslist':(context) => MyRadiologyReportList(),
      'visitlistcasepaper':(context) => MyVisitListCasePaper(),
      'otnotes':(context) => MyOtNotes(),
      'casepaper':(context) =>MyCasePaper(),
      'visitlistdischargesummery':(context) => MyVisitListDischargeSummery(),
     // 'dischargesummery':(context) => MyDischarge(id: ,),
      'admissionform':(context) => MyAdmission(),
      'check':(context) => MyCheck(),
      'visitlistotnotes':(context) => MyVisitlistOtNotes(),
      'visitlistadmission':(context) => MyVisitlistAdmission(),
      'visitlistbills':(context) => MyVisitlistBill(),
      'billlist':(context) => MyBillList(),
      'bill':(context) => MyBill(),
      //'opdbill':(context) => MyOpdBill(),
      'visitlistopdbill':(context) => MyVisitlistOpdBill(),
      //'opdbilllist':(context) => MyOpdBillList(),
    },
  ));
}
