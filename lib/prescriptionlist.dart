// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/reportpathology.dart';
import 'package:http/http.dart' as http;
import 'package:star_flutt/prescription.dart';

// To parse this JSON data, do
//
//     final prescriptionlist = prescriptionlistFromJson(jsonString);

import 'dart:convert';

//List<Prescriptionlist> prescriptionlistFromJson(String str) => List<Prescriptionlist>.from(json.decode(str).map((x) => Prescriptionlist.fromJson(x)));

//String prescriptionlistToJson(List<Prescriptionlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prescriptionlist {
    int? prescriptionId;
    //int? opdIpdId;
    //int? opdIpd;
    DateTime? presDate;
    //int? doctorId;
   // String? remark;
    DateTime? time;
    //int? addedBy;
    //int? updateBy;
    //String? computer;
    //bool? isShownInPharmacy;
    DateTime? followupDate;
    String? followupInstructions;

    Prescriptionlist({
        //this.prescriptionId,
       // this.opdIpdId,
        //this.opdIpd,
        this.presDate,
        //this.doctorId,
        //this.remark,
        this.time,
        //this.addedBy,
        //this.updateBy,
        //this.computer,
        //this.isShownInPharmacy,
        this.followupDate,
        this.followupInstructions,
    });

    factory Prescriptionlist.fromJson(Map<String, dynamic> json) => Prescriptionlist(
        //prescriptionId: json["PrescriptionId"],
        //opdIpdId: json["Opd_Ipd_Id"],
        //opdIpd: json["Opd_Ipd"],
        presDate: json["PresDate"] == null ? null : DateTime.parse(json["PresDate"]),
        //doctorId: json["DoctorId"],
        //remark: json["Remark"],
        time: json["Time"] == null ? null : DateTime.parse(json["Time"]),
        //addedBy: json["AddedBy"],
        //updateBy: json["UpdateBy"],
        //computer: json["Computer"],
        //isShownInPharmacy: json["IsShownInPharmacy"],
        followupDate: json["FollowupDate"] == null ? null : DateTime.parse(json["FollowupDate"]),
        followupInstructions: json["FollowupInstructions"],
    );

    Map<String, dynamic> toJson() => {
        "PrescriptionId": prescriptionId,
        //"Opd_Ipd_Id": opdIpdId,
        //"Opd_Ipd": opdIpd,
        "PresDate": presDate?.toIso8601String(),
        //"DoctorId": doctorId,
        //"Remark": remark,
        "Time": time?.toIso8601String(),
        //"AddedBy": addedBy,
        //"UpdateBy": updateBy,
        //"Computer": computer,
        //"IsShownInPharmacy": isShownInPharmacy,
        "FollowupDate": followupDate?.toIso8601String(),
        "FollowupInstructions": followupInstructions,
    };
}




class MyPrescriptionList extends StatefulWidget {
  const MyPrescriptionList({super.key});

  @override
  State<MyPrescriptionList> createState() => _MyPrescriptionListState();
}

class _MyPrescriptionListState extends State<MyPrescriptionList> {
  List<Prescriptionlist>? apiList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getApiData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      
      child: ListView.builder(
        itemCount: 3,//apiList!.length,
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
            context, MaterialPageRoute(builder: (context) => MyPrescript()))
                  
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const SizedBox(height: 40),
                    Text(
                      'Prescription :',//+'${apiList?[index].prescriptionId}',//'${apiList![index].name}'cbc
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
                          "PrescriptionDate",//${apiList![index].presDate}",
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
                 Divider(height: 20,thickness: 1,color: Colors.black,),
                Text("FollowupDate : "+"12/08/2023",//apiList![index].followupDate 
                style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),
                    Divider(height: 20,thickness: 1,color: Colors.black,),
                    SizedBox(height: 1,),
                ListTile(
                  title: Padding(
                     padding: const EdgeInsets.only(bottom: 15.0),
                    
                    child: Text(
                      'FollowupInstructions :', //apiList![index].followupInstructions
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Text(style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 148, 4, 4)
                      ),"जेवणात कमी तूप आणि तेल खाणे \r\n , आहारात कमी मीठ खा"),
                  
                ),
                SizedBox(height: 4),
                
                    

                   
                  
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
    String url="http://mobileapis.clinosys.com/api/Prescription?opdIpdId=41488&opIpType=0";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Prescriptionlist.fromJson(item)).toList().cast<Prescriptionlist>();
  }
}