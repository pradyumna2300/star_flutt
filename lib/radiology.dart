// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final radiologyr = radiologyrFromJson(jsonString);

import 'dart:convert';

List<Radiologyr> radiologyrFromJson(String str) => List<Radiologyr>.from(json.decode(str).map((x) => Radiologyr.fromJson(x)));

String radiologyrToJson(List<Radiologyr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Radiologyr {
    String? patientName;
    String? genderName;
    String? consultantName;
    String? regNo;
    DateTime? visitDate;
    DateTime? visitTime;
    String? opdNo;
    dynamic radiologyDocName;
    DateTime? reportDate;
    DateTime? reportTime;
    String? resultEntry;
    String? suggestionNotes;
    String? userName;
    int? radReportId;
    String? printTestName;
    String? categoryName;
    dynamic education;
    String? ageDay;
    String? ageYear;
    String? ageMonth;
    int? categoryId;
    int? testId;

    Radiologyr({
        this.patientName,
        this.genderName,
        this.consultantName,
        this.regNo,
        this.visitDate,
        this.visitTime,
        this.opdNo,
        this.radiologyDocName,
        this.reportDate,
        this.reportTime,
        this.resultEntry,
        this.suggestionNotes,
        this.userName,
        this.radReportId,
        this.printTestName,
        this.categoryName,
        this.education,
        this.ageDay,
        this.ageYear,
        this.ageMonth,
        this.categoryId,
        this.testId,
    });

    factory Radiologyr.fromJson(Map<String, dynamic> json) => Radiologyr(
        patientName: json["PatientName"],
        genderName: json["GenderName"],
        consultantName: json["ConsultantName"],
        regNo: json["RegNo"],
        visitDate: json["VisitDate"] == null ? null : DateTime.parse(json["VisitDate"]),
        visitTime: json["VisitTime"] == null ? null : DateTime.parse(json["VisitTime"]),
        opdNo: json["OPDNo"],
        radiologyDocName: json["RadiologyDocName"],
        reportDate: json["ReportDate"] == null ? null : DateTime.parse(json["ReportDate"]),
        reportTime: json["ReportTime"] == null ? null : DateTime.parse(json["ReportTime"]),
        resultEntry: json["ResultEntry"],
        suggestionNotes: json["SuggestionNotes"],
        userName: json["UserName"],
        radReportId: json["RadReportId"],
        printTestName: json["PrintTestName"],
        categoryName: json["CategoryName"],
        education: json["Education"],
        ageDay: json["AgeDay"],
        ageYear: json["AgeYear"],
        ageMonth: json["AgeMonth"],
        categoryId: json["CategoryId"],
        testId: json["TestId"],
    );

    Map<String, dynamic> toJson() => {
        "PatientName": patientName,
        "GenderName": genderName,
        "ConsultantName": consultantName,
        "RegNo": regNo,
        "VisitDate": visitDate?.toIso8601String(),
        "VisitTime": visitTime?.toIso8601String(),
        "OPDNo": opdNo,
        "RadiologyDocName": radiologyDocName,
        "ReportDate": reportDate?.toIso8601String(),
        "ReportTime": reportTime?.toIso8601String(),
        "ResultEntry": resultEntry,
        "SuggestionNotes": suggestionNotes,
        "UserName": userName,
        "RadReportId": radReportId,
        "PrintTestName": printTestName,
        "CategoryName": categoryName,
        "Education": education,
        "AgeDay": ageDay,
        "AgeYear": ageYear,
        "AgeMonth": ageMonth,
        "CategoryId": categoryId,
        "TestId": testId,
    };
}


class MyRadiologyReport extends StatefulWidget {
  const MyRadiologyReport({super.key});

  @override
  State<MyRadiologyReport> createState() => _MyRadiologyReportState();
}

class _MyRadiologyReportState extends State<MyRadiologyReport> {
  List<Radiologyr>? apiList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Radiology Report") ,backgroundColor: Color.fromARGB(255, 5, 117, 134),),
    
  

    body: Container(
      
      color: Colors.white,

      
      
      child: ListView.builder(
         physics: ClampingScrollPhysics(),
        itemCount: 1,
        itemBuilder:(BuildContext context, int index){
          return Container(
            child: Column(
              children:  <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30, left: 50, right: 50),
                ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 6,
              color: Color.fromARGB(255, 246, 245, 244),
              semanticContainer: true,
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                onTap: () => {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const SizedBox(height: 20),
                    const Text(
                      ' Consultant Doctor',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      ' ${apiList![index].consultantName}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                    ),
                    const SizedBox(height: 19),
                   Divider(height: 20,thickness: 2,color: Colors.black,),
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
                          "${apiList![index].reportTime}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "6:50 PM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 18,
                  thickness: 2,
                  color: Colors.black,
                ),
                Text("Patient Name :"+"${apiList![index].patientName}",//PatientNamee
                style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),
                    
                ListTile(
                  title: Text("RegNo :"+"${apiList![index].regNo}",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),),//RegNo
                  subtitle:Text("Age :"+"${apiList![index].ageYear}",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),), 
                  trailing: Text("Gender :"+"${apiList![index].genderName}",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),),
                ),
               
                
                Divider(
                  height: 15,
                  thickness: 1,
                  color: Colors.black,
                ),
                

                     //

                    Text("Radiology",
                    style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                   ),
                   SizedBox(height: 4,),
                   Text("Test Name :"+"${apiList![index].printTestName}",
                    style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                   ),SizedBox(height: 4,),
                    Text("Report Id :"+"${apiList![index].radReportId}",
                    style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                   ),
                   
                    const SizedBox(height: 10),
                   Divider(height: 20,thickness: 1,color: Colors.black,), 
                   

                    Card(
                      child: ListView.builder(
                        shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                        itemCount: apiList?.length,
                        itemBuilder: (BuildContext,index){
                        return Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                    ListTile(
                            
                          title: Text('${apiList![index].resultEntry}',//apiList![index].updatedDateTime
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          subtitle: Text(''+"   "+'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.green),),
                          trailing: Text(''),
                          
                          ),
                          // Padding(padding: EdgeInsets.symmetric(horizontal: 15)
                          //),
                          Divider(thickness: 4,color: Colors.black,
                          height: 15,),
                          Padding(
                            padding: EdgeInsets.only(bottom: 30, left: 1),
                            child: Text("Suggestion Notes "+"${apiList![index].suggestionNotes}",style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                                             ),
                          )
                   
                    
                  ],

                        );
                      },
                    ),)
                    
                   
                   
                  
                  ],
                ),

              ),
                ),
                Card()


              ],
            ),

          );

        } ),
    ),);
  }
  
  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/api/Radiology?radReportId=30324&opIpType=0";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Radiologyr.fromJson(item)).toList().cast<Radiologyr>();
  }
}