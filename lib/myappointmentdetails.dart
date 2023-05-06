// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// To parse this JSON data, do
//
//     final doctormodel = doctormodelFromJson(jsonString);

//import 'dart:convert';

//List<Doctormodel> doctormodelFromJson(String str) => List<Doctormodel>.from(json.decode(str).map((x) => Doctormodel.fromJson(x)));

//String doctormodelToJson(List<Doctormodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Doctormodel {
  String id;
  String name;
  String education;
  String department;

  Doctormodel({
    required this.id,
    required this.name,
    required this.education,
    required this.department,
  });

  factory Doctormodel.fromJson(Map<String, dynamic> json) => Doctormodel(
        id: json["Id"],
        name: json["Name"],
        education: json["Education"],
        department: json["Department"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Education": education,
        "Department": department,
      };
}

class MyAppointment extends StatefulWidget {
  const MyAppointment({super.key});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  List<Doctormodel>? apiList;

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
        title: Text("Appointment Details"),
        backgroundColor: Color.fromARGB(255, 3, 138, 93),
      ),
      body: Column(
        children: [if (apiList != null) getList()],
      ),
    );
  }

  Widget getList() {
    return Expanded(
        child: ListView.builder(
      //itemCount: apiList!.length,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 6,
              color: Color.fromARGB(255, 246, 245, 244),
              semanticContainer: true,
              // Implement InkResponse
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                onTap: () => {
                  //launchUrl(Uri.parse(
                  //  'https://dart.dev/guides/language/effective-dart/style')),
                },
                // Add image & text
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 3),
                    const ListTile(
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
                    const Divider(
                      thickness: 4,
                      height: 45,
                      color: Colors.black,
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
                              width: 5,
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
                    const Divider(
                      thickness: 4,
                      height: 45,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Patient Name:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(233, 22, 13, 13),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Pradyumna Kulkarni",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(233, 22, 13, 13),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 10),

                    

                     ListTile(
                      
                    title: Text('Complaints:',//apiList![index].updatedDateTime
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    subtitle: Text("Fever",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    
                    ),



                    //////////////////////////////////


                    ListTile(
                      
                    title: Text('Mobile Number:',//apiList![index].updatedDateTime
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    subtitle: Text("9172723573",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    
                    ),

                    
                    const SizedBox(height: 0),
                    ButtonBar(alignment: MainAxisAlignment.center, children: [
                      TextButton(
                        child: Text(
                          "View Reports",
                          style: TextStyle(fontSize: 15),
                        ),
                        style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 237, 238, 237),
                            backgroundColor:
                                Color.fromARGB(255, 7, 203, 115) // Text Color
                            ),
                        onPressed: () {},
                      ),
                    ]),
                    const SizedBox(height: 0)
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    ));
  }

  Future<void> getApiData() async {
    String url = "http://mobileapis.clinosys.com/Api/DoctorInfo?id=112320";
    var result = await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList = jsonDecode(result.body)
        .map((item) => Doctormodel.fromJson(item))
        .toList()
        .cast<Doctormodel>();
  }
}
