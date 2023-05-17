// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final priscription = priscriptionFromJson(jsonString);

import 'dart:convert';

List<Priscription> priscriptionFromJson(String str) => List<Priscription>.from(json.decode(str).map((x) => Priscription.fromJson(x)));

String priscriptionToJson(List<Priscription> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Priscription {
   String testName;
    int precriptionId;
    DateTime date;
    String className;
    String doseName;
    String? doseNameInMarathi;
    String days;
    String patientName;
    DateTime visitDate;
    DateTime visitTime;
    String opdNo;
    String consultantDocName;
    int opdIpdIp;
    String genderName;
    String regNo;
    String ageYear;
    String ageMonth;
    String ageDay;
    String remark;
    String? itemName;
    String drugName;
    int qty;
    String instruction;
    int duration;
    String durationIn;
    String? genericName;
    int prescriptionId;

    Priscription({
      required this.testName,
        required this.precriptionId,
        required this.date,
        required this.className,
        required this.doseName,
        this.doseNameInMarathi,
        required this.days,
        required this.patientName,
        required this.visitDate,
        required this.visitTime,
        required this.opdNo,
        required this.consultantDocName,
        required this.opdIpdIp,
        required this.genderName,
        required this.regNo,
        required this.ageYear,
        required this.ageMonth,
        required this.ageDay,
        required this.remark,
        this.itemName,
        required this.drugName,
        required this.qty,
        required this.instruction,
        required this.duration,
        required this.durationIn,
        this.genericName,
        required this.prescriptionId,
    });

    factory Priscription.fromJson(Map<String, dynamic> json) => Priscription(
      testName: json["TestName"],
        precriptionId: json["PrecriptionId"],
        date: DateTime.parse(json["Date"]),
        className: json["ClassName"],
        doseName: json["DoseName"],
        doseNameInMarathi: json["DoseNameInMarathi"],
        days: json["Days"],
        patientName: json["PatientName"],
        visitDate: DateTime.parse(json["VisitDate"]),
        visitTime: DateTime.parse(json["VisitTime"]),
        opdNo: json["OPDNo"],
        consultantDocName: json["ConsultantDocName"],
        opdIpdIp: json["OPD_IPD_IP"],
        genderName: json["GenderName"],
        regNo: json["RegNo"],
        ageYear: json["AgeYear"],
        ageMonth: json["AgeMonth"],
        ageDay: json["AgeDay"],
        remark: json["Remark"],
        itemName: json["ItemName"],
        drugName: json["DrugName"],
        qty: json["Qty"],
        instruction: json["Instruction"],
        duration: json["Duration"],
        durationIn: json["DurationIn"],
        genericName: json["GenericName"],
        prescriptionId: json["PrescriptionId"],
    );

    Map<String, dynamic> toJson() => {
      
        "PrecriptionId": precriptionId,
        "Date": date.toIso8601String(),
        "ClassName": className,
        "DoseName": doseName,
        "DoseNameInMarathi": doseNameInMarathi,
        "Days": days,
        "PatientName": patientName,
        "VisitDate": visitDate.toIso8601String(),
        "VisitTime": visitTime.toIso8601String(),
        "OPDNo": opdNo,
        "ConsultantDocName": consultantDocName,
        "OPD_IPD_IP": opdIpdIp,
        "GenderName": genderName,
        "RegNo": regNo,
        "AgeYear": ageYear,
        "AgeMonth": ageMonth,
        "AgeDay": ageDay,
        "Remark": remark,
        "ItemName": itemName,
        "DrugName": drugName,
        "Qty": qty,
        "Instruction": instruction,
        "Duration": duration,
        "DurationIn": durationIn,
        "GenericName": genericName,
        "PrescriptionId": prescriptionId,
    };
}





class MyCasePaper extends StatefulWidget {
  const MyCasePaper({super.key});

  @override
  State<MyCasePaper> createState() => _MyCasePaperState();
}

class _MyCasePaperState extends State<MyCasePaper> {

  List<Priscription>? apiList;
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
        title: Text("Case Paper"),
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
                    "Case Paper",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 4,
                  height: 45,
                  color: Colors.black,
                ),
                
                
                Text("Patient Name :"+" Pradyumna Kulkarni",//PatientNamee
                style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),
                    
                ListTile(
                  title: Text("RegNo :"+" 123",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),),//RegNo
                  subtitle:Text("Age :"+" 25",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),), 
                  trailing: Text("Gender :"+"Male",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)
                    ),),
                    
                ),
                Padding(
                 padding: EdgeInsets.only(top: 5,left:15,right:20),
                
                  child: Text("Address :"+" Flat No2 ABC Complex,3A Road ,Sectore 2,Pune",//PatientNamee
                  style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                      ),
                      
                ),
                Padding(
                 padding: EdgeInsets.only(top: 5,left:15,right:208),
                
                  child: Text("Mobile NO : "+"9172723523",//PatientNamee
                  style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                      ),
                      
                ),
                 Padding(
                 padding: EdgeInsets.only(top: 5,left:1,right:125),
                
                  child: Text(" Date & Time : "+" 12/05/2023 "+" 6:00 PM",//PatientNamee
                  style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                      ),
                      
                ),
               
                 Divider(
                  height: 10,
                  thickness: 1,
                  color: Color.fromARGB(255, 223, 209, 209),
                ),
              
                Text("Doctor Name : "+" Dr.Amit Patil",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54,),),
               Text("Anaesthetist : "+" Dr.Vikas Patil",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54,),),
               Text("Anaesthsia Type : "+"General",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black54,),),
               
                
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
                              "   Weight : "+" 50 "+" , ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "BP : "+"120/80"+" mmhg"+" , ",//${apiList![index].duration}",
                              style: TextStyle(
                                
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "SPO2 : "+"96",//${apiList![index].duration}",
                              style: TextStyle(
                                
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                                    "Chief Complaints : "+"\n"+"c/o DOE, OCCASIONAL ATYPICAL CHEST PAIN,k/c/o htn on rx"),
                    ),
                    Padding(
                      
                      padding: EdgeInsets.only(bottom: 10, left: 15, right: 50),
                      child: Text(style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                                    "History : "+"h/o hysterectomy"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 15, right: 50),
                      child: Text(style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                                    "Allergy : "+"\n"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 15, right: 50),
                      child: Text(style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                                    "History : "),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 15, right: 50),
                      child: Text(style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                                    "Folloup Date : "),
                    ),
                
                   
                
                    
                    Divider(thickness: 2,height: 5,color: Colors.black,),
                    Padding(padding: EdgeInsets.only(top: 10, left: 1, right: 220),
                    child: Text( style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),"Name Of the Surgeon"),),
                    
                    Padding(padding: EdgeInsets.only(bottom: 25, left: 1, right: 220),
                    child: Text( style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),"DR. Amit Patil"),)
                    
              ],
            )
            );
          },
        ),
      ),
    );
  }

  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/api/Prescription?prescId=100501";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Priscription.fromJson(item)).toList().cast<Priscription>();
  }
  
}
