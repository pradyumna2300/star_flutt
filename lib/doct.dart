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







class DoctList extends StatefulWidget {
  const DoctList({super.key});
  

  

  @override
  State<DoctList> createState() => _DoctListState();
}

class _DoctListState extends State<DoctList> {

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
          title: Text("Doctors List"),
          backgroundColor: Color.fromARGB(255, 3, 138, 93),
        ),
        body: Column(
          children: [
            if (apiList!=null)
                getList()
          ],
        ),
    );
  }

  Widget getList(){
    return Expanded(
      child: ListView.builder(
      //itemCount: apiList!.length,
      itemCount: 10,
      itemBuilder: (BuildContext context,int index){
        return Container(

                child: Column(children:<Widget> [
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
                  launchUrl(Uri.parse(
                      'https://dart.dev/guides/language/effective-dart/style')),
                },
                // Add image & text
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink.image(
                       width: double.infinity,
                        //width: 310,
                        height: 225,
                        
                        fit: BoxFit.cover,
                        image: const NetworkImage(
                            'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=900&t=st=1681975975~exp=1681976575~hmac=d23fa5845227b4feae7e91e37ac8dc1063530e1910abbdf96efc03200c8d6e93')),
                    const SizedBox(height: 3),
                    Text(
                      //"pradyumna",
                      '${apiList![index].name}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),const SizedBox(height: 4),
                    Text(
                      //'MBBS,MD,DNB',
                      '${apiList![index].education}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),const SizedBox(height: 3),
                    Text(
                      //'Medicine&Critical Care',
                      '${apiList![index].department}',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),const SizedBox(height: 2),
                    const Text(
                      'Available',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500,color: Color.fromARGB(255, 4, 159, 84)),
                    ),const SizedBox(height: 0),
                    
                    ButtonBar(
                      alignment: MainAxisAlignment.center,

                      children: [
                        TextButton(child:
                        Text("Book Appointment",
                        style: TextStyle(fontSize: 15),),
                       style: TextButton.styleFrom(
                         primary: Color.fromARGB(255, 237, 238, 237),
                          backgroundColor: Color.fromARGB(255, 7, 203, 115) // Text Color
                              ),
                        onPressed:() {

                        },
                        ),
                      ]),
                    const SizedBox(height: 0)
                  ],
                ),
              ),
            ),


            ],)

          );
      },
    )
    );
    
  }

  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/Api/DoctorInfo?id=112320";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Doctormodel.fromJson(item)).toList().cast<Doctormodel>();
  }
}