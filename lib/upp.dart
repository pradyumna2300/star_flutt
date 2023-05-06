// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:star_flutt/myappointmentdetails.dart';

// To parse this JSON data, do
//
//     final doctormodel = doctormodelFromJson(jsonString);

//import 'dart:convert';

//List<Doctormodel> doctormodelFromJson(String str) => List<Doctormodel>.from(json.decode(str).map((x) => Doctormodel.fromJson(x)));

//String doctormodelToJson(List<Doctormodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// To parse this JSON data, do
//
//     final viewapmodel = viewapmodelFromJson(jsonString);

import 'dart:convert';

List<Viewapmodel> viewapmodelFromJson(String str) => List<Viewapmodel>.from(json.decode(str).map((x) => Viewapmodel.fromJson(x)));

String viewapmodelToJson(List<Viewapmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Viewapmodel {
    int appId;
    dynamic regid;
    dynamic doctorList;
    String appTime;
    String complaints;
    dynamic bookFlag;
    int visitFlag;
    int doctorId;
    String patientType;
    String patientName;
    DateTime appDate;
    dynamic visitId;
    dynamic scheduleFor;
    dynamic reason;
    String mobileNo;
    dynamic registrationType;
    dynamic relation;
    dynamic relativeName;
    dynamic doctorfee;
    dynamic emailId;
    int himsApptId;
    int userId;
    bool isCancelled;
    dynamic cancelledDateTime;
    dynamic updatedDateTime;
    DateTime apptDateTime;

    Viewapmodel({
        required this.appId,
        this.regid,
        this.doctorList,
        required this.appTime,
        required this.complaints,
        this.bookFlag,
        required this.visitFlag,
        required this.doctorId,
        required this.patientType,
        required this.patientName,
        required this.appDate,
        this.visitId,
        this.scheduleFor,
        this.reason,
        required this.mobileNo,
        this.registrationType,
        this.relation,
        this.relativeName,
        this.doctorfee,
        this.emailId,
        required this.himsApptId,
        required this.userId,
        required this.isCancelled,
        this.cancelledDateTime,
        this.updatedDateTime,
        required this.apptDateTime,
    });

    factory Viewapmodel.fromJson(Map<String, dynamic> json) => Viewapmodel(
        appId: json["App_ID"],
        regid: json["Regid"],
        doctorList: json["Doctor_List"],
        appTime: json["App_Time"],
        complaints: json["complaints"],
        bookFlag: json["Book_Flag"],
        visitFlag: json["Visit_flag"],
        doctorId: json["Doctor_Id"],
        patientType: json["Patient_Type"],
        patientName: json["Patient_Name"],
        appDate: DateTime.parse(json["App_Date"]),
        visitId: json["Visit_Id"],
        scheduleFor: json["Schedule_For"],
        reason: json["Reason"],
        mobileNo: json["Mobile_No"],
        registrationType: json["Registration_Type"],
        relation: json["Relation"],
        relativeName: json["RelativeName"],
        doctorfee: json["Doctorfee"],
        emailId: json["EmailID"],
        himsApptId: json["HIMSApptId"],
        userId: json["UserId"],
        isCancelled: json["IsCancelled"],
        cancelledDateTime: json["CancelledDateTime"],
        updatedDateTime: json["UpdatedDateTime"],
        apptDateTime: DateTime.parse(json["ApptDateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "App_ID": appId,
        "Regid": regid,
        "Doctor_List": doctorList,
        "App_Time": appTime,
        "complaints": complaints,
        "Book_Flag": bookFlag,
        "Visit_flag": visitFlag,
        "Doctor_Id": doctorId,
        "Patient_Type": patientType,
        "Patient_Name": patientName,
        "App_Date": appDate.toIso8601String(),
        "Visit_Id": visitId,
        "Schedule_For": scheduleFor,
        "Reason": reason,
        "Mobile_No": mobileNo,
        "Registration_Type": registrationType,
        "Relation": relation,
        "RelativeName": relativeName,
        "Doctorfee": doctorfee,
        "EmailID": emailId,
        "HIMSApptId": himsApptId,
        "UserId": userId,
        "IsCancelled": isCancelled,
        "CancelledDateTime": cancelledDateTime,
        "UpdatedDateTime": updatedDateTime,
        "ApptDateTime": apptDateTime.toIso8601String(),
    };
}

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});
  

  

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> 
{

  List<Viewapmodel>? apiList;
  @override
  void initState () {
    // TODO: implement initState
   super.initState();
    getApiData();
  }
   
  @override
  Widget build(BuildContext context) {
     
    return SingleChildScrollView(
      
      child: Padding(padding:  EdgeInsets.symmetric(horizontal: 15),
         
          
            
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
            itemCount: apiList!.length,
            //itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                child: Column(children:<Widget>[
            Padding(
                    padding: EdgeInsets.only(bottom: 5, left: 50, right: 50),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    elevation: 6,
                    color: Color.fromARGB(255, 246, 245, 244),
                    semanticContainer: true,
                    child: InkResponse(
                      containedInkWell: true,
                      highlightShape: BoxShape.rectangle,
                      onTap: () => {
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyAppointment()))
                        //launchUrl(Uri.parse(
                            //'https://dart.dev/guides/language/effective-dart/style')),
                      },
                      child: Column(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            
                          title: Text('${apiList![index].patientName}',//apiList![index].updatedDateTime
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          subtitle: Text("MBBS"),
                          trailing: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/doctor.png"),
                          ),
                          ),
                           Padding(padding: EdgeInsets.symmetric(horizontal: 15)
                          ),
                          Divider(thickness: 1,
                          height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text("Patient Name:",
                                  style: TextStyle(
                                    
                                    fontWeight: FontWeight.bold,
                              color: Color.fromARGB(233, 22, 13, 13),
                            ),),
                                  
                                  
    
                                ],
                              ),
                              Row(
                                children: [
                                  Text("${apiList![index].patientName}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                              color: Color.fromARGB(233, 22, 13, 13),
                            ),),
                                  
                                  
    
                                ],
                              ),
    
                            ],
                          ),
                           Divider(thickness: 1,
                          height: 20,),
                          SizedBox(height:20),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(children: [
                              Icon(Icons.calendar_month,
                            color:Colors.black54,
                            ),
                            SizedBox(width: 5,
    
                            ),
                            Text("${apiList![index].apptDateTime}",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
    
                              color: Colors.black54,
                            ),
                            ),
                            ],
                            ),
                            Row(
                          children: [
                            Icon(
                            Icons.access_time_filled,
                            color:Colors.black54,
                          ),
                          SizedBox(width: 5,),
                          Text("${apiList![index].appTime}",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          )  
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "Confirmed",
                              style: TextStyle(
                                color:Colors.black54,
                              ),
                              )
                          ],
                        ),
    
                            ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){},
                                  child:  Container(
                                width:150,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 142, 143, 143),
                                  borderRadius:BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text("cancel",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
    
                                    ),
    
                                  ),
                                  ),
    
                                ),
                                ),
                              InkWell(
                              onTap: (){},
                              child: Container(
                                width:150,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: Color(0xFf7165D6),
                                  borderRadius:BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text("Resechedule",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
    
                                    ),
                                    //{double? height}
    
                                  ),
                                  ),
    
                                ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                       
                          
                        ]
                        
                        ),
                    ),
    
                  ),
    
          ]
          ),
                
    
                      
                );
            },
          ),
          ),
    );
      
    
    
  }
  

  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/Api/Appointment?userId=8&strStatus=All";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Viewapmodel.fromJson(item)).toList().cast<Viewapmodel>();
  }

}