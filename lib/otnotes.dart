// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

// To parse required this JSON data, do
//
//     final priscription = priscriptionFromJson(jsonString);

// To parse required this JSON data, do
//
//     final otnotemodel = otnotemodelFromJson(jsonString);

import 'dart:convert';

List<Otnotemodel> otnotemodelFromJson(String str) => List<Otnotemodel>.from(json.decode(str).map((x) => Otnotemodel.fromJson(x)));

String otnotemodelToJson(List<Otnotemodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Otnotemodel {
    int operationDetailsId;
    String otSheetNo;
    int regId;
    int opdIpdId;
    DateTime surgeryDate;
    DateTime surgeryStartTime;
    DateTime surgeryEndTime;
    int duration;
    int otId;
    int otTableId;
    int surgeonId;
    int anaesthetistId;
    int anaesthesiaTypeId;
    int otResultId;
    String surgeryNotes;
    String anaesthesiaNotes;
    String remarks;
    bool isOtReserved;
    bool opdIpd;
    int addedBy;
    int updatedBy;
    DateTime date;
    DateTime time;
    String regNo;
    String patientName;
    String otResult;
    String otTableName;
    String viewDoctorName;
    String anaesthesiaTypeName;
    String operationTheatreName;
    String userName;
    DateTime admissionDate;
    String ipdNo;
    String recoveryObservations;
    String surgeryName;
    bool isSupraMajor;
    bool isMajor;
    bool isMinor;
    String surgeryType;
    String anaName;
    String staffname;

    Otnotemodel({
        required  this.operationDetailsId,
         required this.otSheetNo,
         required this.regId,
         required this.opdIpdId,
        required this.surgeryDate,
        required this.surgeryStartTime,
        required this.surgeryEndTime,
        required this.duration,
        required this.otId,
        required this.otTableId,
        required this.surgeonId,
        required this.anaesthetistId,
        required this.anaesthesiaTypeId,
        required this.otResultId,
        required this.surgeryNotes,
        required this.anaesthesiaNotes,
        required this.remarks,
        required this.isOtReserved,
        required this.opdIpd,
        required this.addedBy,
        required this.updatedBy,
        required this.date,
        required this.time,
        required this.regNo,
        required this.patientName,
        required this.otResult,
        required this.otTableName,
        required this.viewDoctorName,
        required this.anaesthesiaTypeName,
        required this.operationTheatreName,
        required this.userName,
        required this.admissionDate,
        required this.ipdNo,
        required this.recoveryObservations,
        required this.surgeryName,
        required this.isSupraMajor,
        required this.isMajor,
        required this.isMinor,
        required this.surgeryType,
        required this.anaName,
        required this.staffname,
    });

    factory Otnotemodel.fromJson(Map<String, dynamic> json) => Otnotemodel(
        operationDetailsId: json["OperationDetailsId"],
        otSheetNo: json["OTSheetNo"],
        regId: json["RegId"],
        opdIpdId: json["Opd_Ipd_Id"],
        surgeryDate: DateTime.parse(json["SurgeryDate"]),
        surgeryStartTime: DateTime.parse(json["SurgeryStartTime"]),
        surgeryEndTime: DateTime.parse(json["SurgeryEndTime"]),
        duration: json["Duration"],
        otId: json["OTId"],
        otTableId: json["OTTableId"],
        surgeonId: json["SurgeonId"],
        anaesthetistId: json["AnaesthetistId"],
        anaesthesiaTypeId: json["AnaesthesiaTypeId"],
        otResultId: json["OTResultId"],
        surgeryNotes: json["SurgeryNotes"],
        anaesthesiaNotes: json["AnaesthesiaNotes"],
        remarks: json["Remarks"],
        isOtReserved: json["IsOTReserved"],
        opdIpd: json["OpdIpd"],
        addedBy: json["AddedBy"],
        updatedBy: json["UpdatedBy"],
        date: DateTime.parse(json["Date"]),
        time: DateTime.parse(json["Time"]),
        regNo: json["RegNo"],
        patientName: json["PatientName"],
        otResult: json["OTResult"],
        otTableName: json["OTTableName"],
        viewDoctorName: json["view_DoctorName"],
        anaesthesiaTypeName: json["AnaesthesiaTypeName"],
        operationTheatreName: json["OperationTheatreName"],
        userName: json["UserName"],
        admissionDate: DateTime.parse(json["AdmissionDate"]),
        ipdNo: json["IPDNo"],
        recoveryObservations: json["RecoveryObservations"],
        surgeryName: json["SurgeryName"],
        isSupraMajor: json["IsSupraMajor"],
        isMajor: json["IsMajor"],
        isMinor: json["IsMinor"],
        surgeryType: json["SurgeryType"],
        anaName: json["AnaName"],
        staffname: json["Staffname"],
    );

    Map<String, dynamic> toJson() => {
        "OperationDetailsId": operationDetailsId,
        "OTSheetNo": otSheetNo,
        "RegId": regId,
        "Opd_Ipd_Id": opdIpdId,
        "SurgeryDate": surgeryDate.toIso8601String(),
        "SurgeryStartTime": surgeryStartTime.toIso8601String(),
        "SurgeryEndTime": surgeryEndTime.toIso8601String(),
        "Duration": duration,
        "OTId": otId,
        "OTTableId": otTableId,
        "SurgeonId": surgeonId,
        "AnaesthetistId": anaesthetistId,
        "AnaesthesiaTypeId": anaesthesiaTypeId,
        "OTResultId": otResultId,
        "SurgeryNotes": surgeryNotes,
        "AnaesthesiaNotes": anaesthesiaNotes,
        "Remarks": remarks,
        "IsOTReserved": isOtReserved,
        "OpdIpd": opdIpd,
        "AddedBy": addedBy,
        "UpdatedBy": updatedBy,
        "Date": date.toIso8601String(),
        "Time": time.toIso8601String(),
        "RegNo": regNo,
        "PatientName": patientName,
        "OTResult": otResult,
        "OTTableName": otTableName,
        "view_DoctorName": viewDoctorName,
        "AnaesthesiaTypeName": anaesthesiaTypeName,
        "OperationTheatreName": operationTheatreName,
        "UserName": userName,
        "AdmissionDate": admissionDate.toIso8601String(),
        "IPDNo": ipdNo,
        "RecoveryObservations": recoveryObservations,
        "SurgeryName": surgeryName,
        "IsSupraMajor": isSupraMajor,
        "IsMajor": isMajor,
        "IsMinor": isMinor,
        "SurgeryType": surgeryType,
        "AnaName": anaName,
        "Staffname": staffname,
    };
}





class MyOtNotes extends StatefulWidget {
  const MyOtNotes({super.key});

  @override
  State<MyOtNotes> createState() => _MyOtNotesState();
}

class _MyOtNotesState extends State<MyOtNotes> {

  List<Otnotemodel>? apiList;
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
        title: Text("OT Notes"),
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
                    "OT NOTES",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 4,
                  height: 45,
                  color: Colors.black,
                ),
                
                
                Text("Patient Name :"+"${apiList![index].patientName}",//PatientNamee
                style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),
                    
                ListTile(
                  title: Text("RegNo :"+"123",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),),//RegNo
                  subtitle:Text("Age :"+"23",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),), 
                  trailing: Text("Gender :"+"Female",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),),
                ),
                 Divider(
                  height: 10,
                  thickness: 1,
                  color: Color.fromARGB(255, 223, 209, 209),
                ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Operation Date  : '+'${apiList![index].surgeryDate .toString()
                                     .split(" ")[0]}',//"${apiList![index].reportTime}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 1,
                        ),
                        Text(
                          "Total Time : "+"${apiList![index].duration}"+"  MIN                   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Time Started : '+'${apiList![index].surgeryStartTime.toString()
                                     .split(" ")[1]}',//"${apiList![index].reportTime}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Time Completed : "+'${apiList![index].surgeryEndTime.toString()
                                     .split(" ")[1]}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                  Divider(
                  height: 10,
                  thickness: 1,
                  color: Color.fromARGB(255, 223, 209, 209),
                ),
              
                Text("Surgen : "+"${apiList![index].surgeonId}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54,),),
               Text("Anaesthetist : "+" ${apiList![index].anaName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54,),),
               Text("Anaesthsia Type : "+"${apiList![index].anaesthesiaTypeName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black54,),),
               
                
                Divider(
                  height: 15,
                  thickness: 1,
                  color: Colors.black,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "   Surgery Name :",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${apiList![index].surgeryName}",//${apiList![index].duration}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 92, 97, 92),
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
                    Divider(thickness: 2,),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 15, right: 50),
                      child: Text(style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                                    "Surgery Notes : "+"\n\n${apiList![index].surgeryNotes}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 15, right: 50),
                      child: Text(style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                                    "Anasthesia Notes : "+"\n\n${apiList![index].anaesthesiaNotes}",),
                    ),
                    Divider(thickness: 2,height: 5,color: Colors.black,),
                    Padding(padding: EdgeInsets.only(top: 10, left: 1, right: 220),
                    child: Text( style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),"Name Of the Surgeon"),),
                    
                    Padding(padding: EdgeInsets.only(bottom: 25, left: 1, right: 220),
                    child: Text( style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),"${apiList![index].surgeonId}"),)
                    
              ],
            )
            );
          },
        ),
      ),
    );
  }

  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/api/OTNotes?opdIpdId=20342&opIpType=1";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Otnotemodel.fromJson(item)).toList().cast<Otnotemodel>();
  }
  
}
