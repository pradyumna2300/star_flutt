// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/reportpathology.dart';
import 'package:http/http.dart' as http;
import 'package:star_flutt/radiology.dart';

// To parse this JSON data, do
//
//     final casepaperlist = casepaperlistFromJson(jsonString);

import 'dart:convert';

List<Casepaperlist> casepaperlistFromJson(String str) => List<Casepaperlist>.from(json.decode(str).map((x) => Casepaperlist.fromJson(x)));

String casepaperlistToJson(List<Casepaperlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Casepaperlist {
    int? casepaperid;
    int? opdipdid;
    DateTime? casepaperdate;
    DateTime? casepaperstarttime;
    DateTime? casepaperendtime;

    Casepaperlist({
        this.casepaperid,
        this.opdipdid,
        this.casepaperdate,
        this.casepaperstarttime,
        this.casepaperendtime,
    });

    factory Casepaperlist.fromJson(Map<String, dynamic> json) => Casepaperlist(
        casepaperid: json["casepaperid"],
        opdipdid: json["opdipdid"],
        casepaperdate: json["casepaperdate"] == null ? null : DateTime.parse(json["casepaperdate"]),
        casepaperstarttime: json["casepaperstarttime"] == null ? null : DateTime.parse(json["casepaperstarttime"]),
        casepaperendtime: json["casepaperendtime"] == null ? null : DateTime.parse(json["casepaperendtime"]),
    );

    Map<String, dynamic> toJson() => {
        "casepaperid": casepaperid,
        "opdipdid": opdipdid,
        "casepaperdate": casepaperdate?.toIso8601String(),
        "casepaperstarttime": casepaperstarttime?.toIso8601String(),
        "casepaperendtime": casepaperendtime?.toIso8601String(),
    };
}



class MyCasePaperList extends StatefulWidget {
  const MyCasePaperList({super.key});

  @override
  State<MyCasePaperList> createState() => _MyCasePaperListState();
}

class _MyCasePaperListState extends State<MyCasePaperList> {
  List< Casepaperlist>? apiList;
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
        itemCount:apiList!.length,
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
            context, MaterialPageRoute(builder: (context) => MyRadiologyReport()))
                  
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const SizedBox(height: 40),
                    Text(
                      'Case Paper :'+"${apiList![index].casepaperid}",//cbc
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
                        Text(
                          "${apiList![index].casepaperstarttime}",
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
                          "6:50 PM",
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
    String url="http://mobileapis.clinosys.com/api/CasePaper?opdIpdId=30473&opIpType=0";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) =>  Casepaperlist.fromJson(item)).toList().cast< Casepaperlist>();
  }
}