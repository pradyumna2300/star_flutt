// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;



List<Cours> courseFromJson(String str) => List<Cours>.from(json.decode(str).map((x) => Cours.fromJson(x)));

String courseToJson(List<Cours> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cours {
  //  int? dischargeSummaryId;
    //String? drugName;
    String doseName;
    //int? qty;
    //String? instruction;
    //String? durationIn;

    Cours({
      //  this.dischargeSummaryId,
       // this.drugName,
        required this.doseName,
        //this.qty,
        //this.instruction,
        //this.durationIn,
    });

    factory Cours.fromJson(Map<String, dynamic> json) => Cours(
        //dischargeSummaryId: json["DischargeSummaryId"],
        //drugName: json["DrugName"],
        doseName: json["DoseName"],
        //qty: json["Qty"],
        //instruction: json["Instruction"],
        //durationIn: json["DurationIn"],
    );

    Map<String, dynamic> toJson() => {
        //"DischargeSummaryId": dischargeSummaryId,
        //"DrugName": drugName,
        "DoseName": doseName,
        //"Qty": qty,
        //"Instruction": instruction,
        //"DurationIn": durationIn,
    };
}

class MyCheck extends StatefulWidget {
  const MyCheck({super.key});

  @override
  State<MyCheck> createState() => _MyCheckState();
}

class _MyCheckState extends State<MyCheck> {
  //List<Dischargesum>? apiList;
  List<Cours>? apiList;
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
          itemCount:6, //apiList!.length,
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
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    
                    ListTile(
                                      contentPadding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      title: Text(
                                        'AZHITHROMICIN', //
                                        
                                       // "${apiList?[index].drugName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                           // "Dose :",// + 
                                           "${apiList?[index].doseName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Instruction : ",// +"${apiList?[index].instruction}",
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
                                          "${apiList![index].doseName} "), //"${apiList![index].duration}+${apiList![index].durationIn
                                    ),
                    
                    SizedBox(
                      height: 10,
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
        "http://mobileapis.clinosys.com/api/TreatGiven?dischSummId=10328";
    var result = await http.get(Uri.parse(url));
   
    print(result.statusCode);
    print(result.body);
    
    apiList=jsonDecode(result.body).map((item) => Cours.fromJson(item)).toList().cast<Cours>();
   
  }
  
}
