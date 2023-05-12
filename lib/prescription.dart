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





class MyPrescript extends StatefulWidget {
  const MyPrescript({super.key});

  @override
  State<MyPrescript> createState() => _MyPrescriptState();
}

class _MyPrescriptState extends State<MyPrescript> {

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
        title: Text("Prescription"),
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
                    "Prescription",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 4,
                  height: 45,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    'Anand Divan', //apiList![index].updatedDateTime
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("MBBS"),
                  trailing: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/doctor.png"),
                  ),
                ),
                Divider(
                  height: 18,
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
                          "12/05/2023",
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
                              "   Course :",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "14 "+"days",//${apiList![index].duration}",
                              style: TextStyle(
                                color: Colors.green,
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
                    Divider(thickness: 2,),
                    SizedBox(height: 10,),
                    Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 6,
              color: Color.fromARGB(255, 246, 245, 244),
              semanticContainer: true,
              // Implement InkResponse
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                onTap: () => {},
                // Add image & text
                child: ListView.builder(
                   shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index){
                    return  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                            
                          title: Text('AZHITHROMICIN',//apiList![index].updatedDateTime
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          subtitle: Text("1-0-1"),//"${apiList![index].opdIpdIp}"),
                          trailing: Text("2days "),
                          
                          ),
                          // Padding(padding: EdgeInsets.symmetric(horizontal: 15)
                          //),
                          Divider(thickness: 1,
                          height: 15,),
                   
                    
                  ],
                );

                }
                )
               
              ),
            ),
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
