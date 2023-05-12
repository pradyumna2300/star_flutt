// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/pathalogy.dart';
import 'package:http/http.dart' as http;
import 'package:star_flutt/prescriptionlist.dart';

// To parse this JSON data, do
//
//     final visitmodel = visitmodelFromJson(jsonString);

import 'dart:convert';

import 'package:star_flutt/prescription.dart';

List<Visitmodel> visitmodelFromJson(String str) => List<Visitmodel>.from(json.decode(str).map((x) => Visitmodel.fromJson(x)));

String visitmodelToJson(List<Visitmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Visitmodel {
    int visitId;
    String patientName;
    DateTime visitDateTime;
    String doctorName;

    Visitmodel({
        required this.visitId,
        required this.patientName,
        required this.visitDateTime,
        required this.doctorName,
    });

    factory Visitmodel.fromJson(Map<String, dynamic> json) => Visitmodel(
        visitId: json["VisitId"],
        patientName: json["PatientName"],
        visitDateTime: DateTime.parse(json["VisitDateTime"]),
        doctorName: json["DoctorName"],
    );

    Map<String, dynamic> toJson() => {
        "VisitId": visitId,
        "PatientName": patientName,
        "VisitDateTime": visitDateTime.toIso8601String(),
        "DoctorName": doctorName,
    };
}


class MyVisitListPrescription extends StatefulWidget {
  const MyVisitListPrescription({super.key});

  @override
  State<MyVisitListPrescription> createState() => _MyVisitListPrescriptionState();
}

class _MyVisitListPrescriptionState extends State<MyVisitListPrescription> {
  List<Visitmodel>? apiList;
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
            context, MaterialPageRoute(builder: (context) => MyPrescriptionList()))
                  
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
                          subtitle: Text('VisitId: '+'${apiList![index].visitId}'),
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
                        
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '${apiList![index].visitDateTime}',
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
                        //Icon(
                          //Icons.access_time_filled,
                          //color: Color.fromARGB(137, 0, 0, 0),
                        //),
                        SizedBox(
                          width: 10,
                        ),
                       // Text(
                         // "6:50 PM",
                          //style: TextStyle(
                           // fontWeight: FontWeight.bold,
                            //fontSize: 18,
                            //color: Color.fromARGB(135, 4, 70, 39),
                          //),
                        //),
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
            context, MaterialPageRoute(builder: (context) => MyPrescriptionList()));
                        },//prescription
                        child: Container(
                          width:150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 5, 117, 134),
                            borderRadius:BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("Prescription",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,

                              ),
                              //{double? height}

                            ),
                            ),

                          ),
                          ),
                        InkWell(
                        onTap: (){
                        //  Navigator.push(
            //context, MaterialPageRoute(builder: (context) => MyPatho()));

                        },
                        child: Container(
                          width:150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 5, 117, 134),
                            borderRadius:BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("View",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
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
    String url="http://mobileapis.clinosys.com/api/Visits?regNo=374";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Visitmodel.fromJson(item)).toList().cast<Visitmodel>();
  }
}