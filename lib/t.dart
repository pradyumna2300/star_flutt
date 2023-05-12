// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/reportpathology.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final reportlist = reportlistFromJson(jsonString);

import 'dart:convert';

List<Reportlist> reportlistFromJson(String str) => List<Reportlist>.from(json.decode(str).map((x) => Reportlist.fromJson(x)));

String reportlistToJson(List<Reportlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reportlist {
    int precriptionId;
    String consultantDocName;
    String drugName;
    //int duration;
    //int prescriptionId;
     

    Reportlist({
       required this.precriptionId,
       required this.consultantDocName,
       required this.drugName,
       //required this.duration,
       
        
    });

    factory Reportlist.fromJson(Map<String, dynamic> json) => Reportlist(
        precriptionId: json["PrecriptionId"],
        consultantDocName: json["ConsultantDocName"],
        drugName: json["DrugName"],
        //duration: json["Duration"],
        
        
    );

    Map<String, dynamic> toJson() => {
         "PrecriptionId": precriptionId,
         "ConsultantDocName": consultantDocName,
         "DrugName": drugName,
         //"Duration": duration,
       
    };
}





class MyPatho extends StatefulWidget {
  const MyPatho({super.key});

  @override
  State<MyPatho> createState() => _MyPathoState();
}

class _MyPathoState extends State<MyPatho> {
  List<Reportlist>? apiList;
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
        itemCount: 2,//apiList!.length,
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
                onTap: () => {
                   Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyReportPatho()))
                  
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const SizedBox(height: 40),
                    Text(
                      '${apiList![index].precriptionId}',//'${apiList![index].name}'cbc
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),const SizedBox(height: 19),
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
                          width: 2,
                        ),
                        Text(//'ajhsk',
                         '${apiList![index].consultantDocName}',
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
                        Text('${apiList![index].drugName}',
                          //'${apiList?[index].duration}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(135, 4, 70, 39),
                          ),
                        ),
                        SizedBox(height: 70,)
                      ],
                    ),
                  ],
                ),
                   
                  
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
    String url="http://mobileapis.clinosys.com/api/Prescription?prescId=100501";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Reportlist.fromJson(item)).toList().cast<Reportlist>();
  }
}