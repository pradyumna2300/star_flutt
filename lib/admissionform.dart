// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:star_flutt/model/dischargesum.dart';
import 'package:star_flutt/model/admissionmodel.dart';
// To parse this JSON data, do
//
//     final priscription = priscriptionFromJson(jsonString);


class MyAdmission extends StatefulWidget {
  const MyAdmission({super.key});

  @override
  State<MyAdmission> createState() => _MyAdmissionState();
}

class _MyAdmissionState extends State<MyAdmission> {
  List<Admissionmodel>? apiList;
  List<Course>? apiLista;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admission Form"),
        backgroundColor: Color.fromARGB(255, 5, 117, 134),
      ),
      body: Container(
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 50, right: 50),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Admission Form",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  
                ),
                Divider(
                  thickness: 4,
                  height: 45,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${apiList![index].hospitalName}",
                  style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 84, 10))),
                ),
                Divider(
                  thickness: 3,
                  height: 45,
                  color: Colors.black,
                ),
                Text(
                  //"${apiList![index].patientName}",//
                  "Patient Name :" + " ${apiList![index].patientName}", //PatientNamee
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)),
                ),
                ListTile(
                  title: Text(
                    "RegNo :" + "${apiList![index].regNo}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ), //RegNo
                  subtitle: 
                      Text(
                    "Age :" + "${apiList![index].age}",//${apiList![index].age}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                  trailing: Text(
                    "Gender :" + "${apiList![index].genderName}",//"${apiList![index].genderName}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15,bottom: 5),
                      child: Text(
                        "Address :  "+"${apiList![index].address}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                       padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                       child: Text(
                        "Mobile NO :  "+"${apiList![index].mobileNo}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      ),
                      Container(
                       padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                       child: Text(
                        "Admission :  "+"${apiList![index].admissionDate .toString()
                                     .split(" ")[0]}" +" "+"${apiList![index].dot}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      ),
                      Container(
                       padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                       child: Text(
                        "IP No :  "+"${apiList![index].ipdNo}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      ),
                      Container(
                       padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                       child: Text(
                        "Room Type :  "+'${apiList![index].roomName}' +"  "+"Ward No : "+"${apiList![index].wardId}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      ),
                      Divider(thickness: 1,color: Colors.black,height: 3,),
                      Container(padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                    
                      child: Text("Doctor Name : "+"${apiList![index].admittedDoctorName}",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),),
                      Container(padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                    
                      child: Text("Ref. Doctor : "+"${apiList![index].refDoctorName}",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),),Divider(thickness: 1,color: Colors.black,height: 3,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Relative Information",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 11, 5, 0)),),
                              
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Relative Name : " +" ${apiList![index].relativeName}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                     Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Address : " +" ${apiList![index].relativeAddress}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                      Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Relation : " +" ${apiList![index].relationshipName}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),

                    Divider(thickness: 1,color: Colors.black,height: 3,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" MLC",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 11, 5, 0)),),
                              
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "IS MLC : " +" ${apiList![index].isMlc}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                     Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "MLC NO : " +"${apiList![index].mlcNo}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                      Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "MLC Date : " +" ${apiList![index].mlcDate}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    
                      Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Police Station : " +" ${apiList![index].policeStation}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    
                      Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Constable : " +" ${apiList![index].authorityName}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    
                      Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Bukkle No : " +" ${apiList![index].authorityBuckleNo}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),

                    Divider(thickness: 1,color: Colors.black,height: 3,),
                   
                   
                   
                    
                    
                    Divider(
                      thickness: 4,
                      height: 50,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ));
          },
        ),
      ),
    );
  }

  Future<void> getApiData() async {
    String url =
        "http://mobileapis.clinosys.com/api/Admissions?admissionId=20342&opIpType=1";
    var result = await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    
    apiList=jsonDecode(result.body).map((item) => Admissionmodel.fromJson(item)).toList().cast<Admissionmodel>();
    
  }
 
}
