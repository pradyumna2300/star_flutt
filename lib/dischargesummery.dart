// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:star_flutt/model/dischargesum.dart';
// To parse this JSON data, do
//
//     final priscription = priscriptionFromJson(jsonString);



class MyDischarge extends StatefulWidget {
  const MyDischarge({super.key});

  @override
  State<MyDischarge> createState() => _MyDischargeState();
}

class _MyDischargeState extends State<MyDischarge> {
  List<Dischargesum>? apiList;
  List<Course>? apiLista;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
    //getCourseApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discharge Summery"),
        backgroundColor: Color.fromARGB(255, 5, 117, 134),
      ),
      body: Container(
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: 1,//apiList!.length,
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
                    "Discharge Summery",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 4,
                  height: 45,
                  color: Colors.black,
                ),
                Text(
                  "${apiList![index].patientName}",//"Patient Name :" + " Pradyumna Kulkarni", //PatientNamee
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 53, 7)),
                ),
                ListTile(
                  title: Text(
                    "RegNo :" + " 123",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ), //RegNo
                  subtitle: Text(
                    "Age :" + "${apiList![index].age}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                  trailing: Text(
                    "Gender :" + "${apiList![index].genderName}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                ),
                Padding(
                  
                  padding: EdgeInsets.only(top: 5, left: 15, right: 20),
                  child: Text(
                    "Address :" +
                         "${apiList![index].address}", //PatientNamee
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15, right: 208),
                  child: Text(
                    "Mobile NO : " + "${apiList![index].mobileNo}", //PatientNamee
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 1, right: 150),
                  child: Text(
                    " Date Of Admission : " +
                         "${apiList![index].admissionDate .toString()
                                     .split(" ")[0]}" ,//+
                       // " 6:00 PM" //PatientNamee
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 1, right: 82),
                  child: Text(
                    " Date Of Discharge : " +
                         "${apiList![index].dischargeDate}",// +
                       // " 6:00 PM", //PatientNamee
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15, right: 185),
                  child: Text(
                    "Followup Date : " + "${apiList![index].followupdate .toString()
                                     .split(" ")[0]}", //PatientNamee
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 106, 53, 7)),
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  color: Color.fromARGB(255, 223, 209, 209),
                ),
                Text(
                  "Consultant : " + " ${apiList![index].discDoctor1}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 0.913),
                  ),
                ),
                Divider(
                  height: 15,
                  thickness: 3,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Final Diagnosis :  ",
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
                        "${apiList![index].diagnosis}  ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 107, 49, 2)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    
                    Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "History :  ",
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
                        "${apiList![index].history}  ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 107, 49, 2)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    
                    
                    Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                      child: Text(
                        "Clinical Finding :  ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 5, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text("${apiList![index].clinicalFinding}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 106, 53, 7)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Investigations :  ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text("${apiList![index].investigation}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 106, 53, 7)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Operative Notes :  ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "${apiList![index].opertiveNotes}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 124, 56, 3)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),Course In Hospital
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Course In Hospital",//+"${apiList![index].doseName}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 10),
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
                              itemCount: 3,//apiLista!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      title: Text(
                                        'AZHITHROMICIN', 
                                       //apiLista![indx].drugName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Generic Name : " +
                                                "VILDAGLIPTIN 100MG + DAPAGLIFLOZIN 10MG ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Dose :" ,//+ "${apiList?[index].doseName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Instruction : " +
                                                "सकाळी ८ वाजता - सांध्य ४ वाजता ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      //Text("1-0-1"),
                                      //"${apiList![index].doseName}"),

                                      trailing: Text(
                                          "23"), //"${apiList![index].duration}+${apiList![index].durationIn
                                    ),
                                    // Padding(padding: EdgeInsets.symmetric(horizontal: 15)
                                    //),
                                    Divider(
                                      thickness: 1,
                                      height: 15,
                                    ), //Treatment Given In Hospita
                                  ],
                                );
                              })),
                    ),
                   
                    /*
                    ListTile(
                                      contentPadding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      title: Text(
                                        //'AZHITHROMICIN', //
                                        
                                        "${apiLista![index].drugName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dose :" + 
                                           "${apiLista![index].doseName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Instruction : " +"${apiLista![index].instruction}",
                                               // "${apiLista?[index].instruction} ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      //Text("1-0-1"),
                                      //"${apiList![index].doseName}"),

                                      trailing: Text(
                                          "${apiLista![index].qty} "), //"${apiList![index].duration}+${apiList![index].durationIn
                                    ),*/
                    
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Treatment Given In Hospital :",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      child: Text(
                        "${apiList![index].treatmentGiven} ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 106, 53, 7)),
                      ),
                      //decoration: BoxDecoration(color: Colors.green),
                    ),
                    //
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Condition On Discharge :",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "${apiList![index].conditionOnDischarge}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 106, 53, 7)),
                      ),
                      //decoration: BoxDecoration(color: Colors.green),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Treatment After Discharge :",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 10),
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
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      title: Text(
                                        'AZHITHROMICIN', //apiList![index].drugName
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Generic Name : " +
                                                "VILDAGLIPTIN 100MG + DAPAGLIFLOZIN 10MG ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Dose :" + "1-0-1",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Instruction : " +
                                                "सकाळी ८ वाजता - सांध्य ४ वाजता ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      //Text("1-0-1"),
                                      //"${apiList![index].doseName}"),

                                      trailing: Text(
                                          "23"), //"${apiList![index].duration}+${apiList![index].durationIn
                                    ),
                                    // Padding(padding: EdgeInsets.symmetric(horizontal: 15)
                                    //),
                                    Divider(
                                      thickness: 1,
                                      height: 15,
                                    ), //Treatment Given In Hospita
                                  ],
                                );
                              })),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Follow Up Instruction :",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "{\\rtf1\\ansi\\ansicpg1252\\uc1\\htmautsp\\deff2{\\fonttbl{\\f0\\fcharset0 Times New Roman;}{\\f2\\fcharset0 Segoe UI;}{\\f3\\fcharset0 cambria;}{\\f4\\fcharset0 mangal;}}{\\colortbl\\red0\\green0\\blue0;\\red255\\green255\\blue255;}\\loch\\hich\\dbch\\pard\\plain\\ltrpar\\itap0{\\lang1033\\fs18\\f2\\cf0 \\cf0\\ql{\\fs20\\f3 \\ql{\\f4 {\\ltrch \⌥?\⍐?\⍨? \⍐?\⍠?\⍦?\⍔?\⍵?\⍂?\⍦?\⍒? \⌐?\⍡?\⍦?\⍒? \⌨?\⎁?\⍑?\⍦? }\\li0\\ri0\\sa0\\sb0\\fi0\\ql\\par}\r\n}\r\n}\r\n}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 120, 54, 3)),
                      ),
                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Follow Date : "+"${apiList![index].followupdate}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),

                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Dr Name : "+"${apiList![index].discDoctor1}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),

                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10,bottom: 20),
                      child: Text(
                        "${apiList![index].doctorEdc1}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 6, 0)),
                      ),

                      //decoration: BoxDecoration(color: Colors.yellow),
                    ),

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
        "http://mobileapis.clinosys.com/api/DischSumm?admId=20342";
     String urla =
        "http://mobileapis.clinosys.com/api/TreatGiven?dischSummId=10328";    
    var result = await http.get(Uri.parse(url));
    var resulta = await http.get(Uri.parse(urla));
    print(result.statusCode);
    print(result.body);
    print(resulta.statusCode);
    print(resulta.body);
    apiList=jsonDecode(result.body).map((item) => Dischargesum.fromJson(item)).toList().cast<Dischargesum>();
    apiLista=jsonDecode(result.body).map((item) => Course.fromJson(item)).toList().cast<Course>();
    //apiList = jsonDecode(result.body)
      //  .map((item) => Dischargesum.fromJson(item))
        //.toList()
        //.cast<Dischargesum>();
  }
  /*
  Future<void> getCourseApiData() async {
    String url =
        "http://mobileapis.clinosys.com/api/TreatGiven?dischSummId=10328";
    var result = await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiLista=jsonDecode(result.body).map((item) => Course.fromJson(item)).toList().cast<Course>();
 
    //apiList = jsonDecode(result.body)
      //  .map((item) => Dischargesum.fromJson(item))
        //.toList()
        //.cast<Dischargesum>();
  }*/
}
