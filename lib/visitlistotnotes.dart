// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/dischargesummery.dart';
import 'package:star_flutt/otnotes.dart';
import 'package:star_flutt/pathalogy.dart';
import 'package:http/http.dart' as http;
import 'package:star_flutt/prescriptionlist.dart';
import 'package:star_flutt/radiologyreportslist.dart';

// To parse this JSON data, do
//
//     final dischargesummerylist = dischargesummerylistFromJson(jsonString);

import 'dart:convert';

List<Dischargesummerylist> dischargesummerylistFromJson(String str) => List<Dischargesummerylist>.from(json.decode(str).map((x) => Dischargesummerylist.fromJson(x)));

String dischargesummerylistToJson(List<Dischargesummerylist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dischargesummerylist {
    int? admissionId;
    String? patientName;
    String? admissionDate;
    String? admissionTime;
    DateTime? admissionDateTime;
    String? doctorName;
    dynamic ipdNo;

    Dischargesummerylist({
        this.admissionId,
        this.patientName,
        this.admissionDate,
        this.admissionTime,
        this.admissionDateTime,
        this.doctorName,
        this.ipdNo,
    });

    factory Dischargesummerylist.fromJson(Map<String, dynamic> json) => Dischargesummerylist(
        admissionId: json["AdmissionId"],
        patientName: json["PatientName"],
        admissionDate: json["AdmissionDate"],
        admissionTime: json["AdmissionTime"],
        admissionDateTime: json["AdmissionDateTime"] == null ? null : DateTime.parse(json["AdmissionDateTime"]),
        doctorName: json["DoctorName"],
        ipdNo: json["IPDNo"],
    );

    Map<String, dynamic> toJson() => {
        "AdmissionId": admissionId,
        "PatientName": patientName,
        "AdmissionDate": admissionDate,
        "AdmissionTime": admissionTime,
        "AdmissionDateTime": admissionDateTime?.toIso8601String(),
        "DoctorName": doctorName,
        "IPDNo": ipdNo,
    };
}


class MyVisitlistOtNotes extends StatefulWidget {
  const MyVisitlistOtNotes({super.key});

  @override
  State<MyVisitlistOtNotes> createState() => _MyVisitlistOtNotesState();
}

class _MyVisitlistOtNotesState extends State<MyVisitlistOtNotes> {
  List<Dischargesummerylist>? apiList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.white,
      
      child: ListView.builder(
        itemCount: apiList!.length,
        itemBuilder:(BuildContext context, int index){
          return Container(
            child: Column(
              children:  <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 50, right: 50),
                ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 6,
              color: Color.fromARGB(255, 246, 245, 244),
              semanticContainer: true,
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                onTap: () => {
                   Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyRadiologyReportList()))
                  
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const SizedBox(height: 20),
                     ListTile(
                      title: Text("Dr."+'${apiList![index].doctorName}',//apiList![index].updatedDateTime
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          subtitle: Text('Admission ID: '+'${apiList![index].admissionId}'),
                          trailing: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/doctor.png"),
                          ),

                     ),
                   
                   
                   Divider(height: 20,thickness: 2,color: Colors.black,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text("Patient Name : "+'${apiList![index].patientName}', style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),)
                   ],),
                    Divider(height: 20,thickness: 1,color: Colors.black,),
                   
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(137, 0, 0, 0),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                         //'23/05/2023' ,///
                         '${apiList![index].admissionDate}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(137, 4, 125, 28),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: Color.fromARGB(137, 0, 0, 0),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          //"6:50 PM",
                          '${apiList![index].admissionTime}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(135, 4, 70, 39),
                          ),
                        ),
                        SizedBox(height: 70,)
                      ],
                    ),
                    Row(
                  children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "Done",
                              style: TextStyle(
                                color:Colors.black54,
                              ),
                              )
                          ],
                ),
                
                  ],
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                  
                      InkWell(
                        onTap: (){
                           Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyOtNotes()));
                        },//prescription
                        child: Container(
                          width:190,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 5, 117, 134),
                            borderRadius:BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("OT Notes",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,

                              ),
                              //{double? height}

                            ),
                            ),

                          ),
                          ),
                        
                ],
                ),
                SizedBox(height: 16,)
                
                   
                  
                  ],
                ),

              ),
                ),


              ],
            ),

          );

        } ),
    );
  }
  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/api/Admissions?regNo=1754";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Dischargesummerylist.fromJson(item)).toList().cast<Dischargesummerylist>();
  }
}