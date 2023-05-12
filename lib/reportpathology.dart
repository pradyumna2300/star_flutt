// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final reportmodel = reportmodelFromJson(jsonString);

import 'dart:convert';

List<Reportmodel> reportmodelFromJson(String str) => List<Reportmodel>.from(json.decode(str).map((x) => Reportmodel.fromJson(x)));

String reportmodelToJson(List<Reportmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reportmodel {
    String test;
    String result;
    String unit;
    String referenceRange;

    Reportmodel({
        required this.test,
        required this.result,
        required this.unit,
        required this.referenceRange,
    });

    factory Reportmodel.fromJson(Map<String, dynamic> json) => Reportmodel(
        test: json["Test"],
        result: json["Result"],
        unit: json["Unit"],
        referenceRange: json["ReferenceRange"],
    );

    Map<String, dynamic> toJson() => {
        "Test": test,
        "Result": result,
        "Unit": unit,
        "ReferenceRange": referenceRange,
    };
}


class MyReportPatho extends StatefulWidget {
  const MyReportPatho({super.key});

  @override
  State<MyReportPatho> createState() => _MyReportPathoState();
}

class _MyReportPathoState extends State<MyReportPatho> {
  List<Reportmodel>? apiList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Pathology Report") ,backgroundColor: Color.fromARGB(255, 5, 117, 134),),
    
  

    body: Container(
      
      color: Colors.white,

      
      
      child: ListView.builder(
         physics: ClampingScrollPhysics(),
        itemCount: 1,
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
                onTap: () => {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const SizedBox(height: 20),
                    const Text(
                      ' Consultant Doctor',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      ' Dr Pankaj Gore',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                    ),
                    const SizedBox(height: 19),
                   Divider(height: 20,thickness: 2,color: Colors.black,),
                   const Text(
                      ' Pathalogy Doctor',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 53, 7)),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      ' Dr Prakash Gore',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                    ),
                    const SizedBox(height: 10),
                     Divider(height: 20,thickness: 2,color: Colors.black,),
                    Text("CBC",
                    style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 2, 95, 29)),
                   ),
                    const SizedBox(height: 19),
                   Divider(height: 20,thickness: 1,color: Colors.black,), 
                   

                    Card(
                      child: ListView.builder(
                        shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                        itemCount: apiList!.length,
                        itemBuilder: (BuildContext,index){
                        return Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                    ListTile(
                            
                          title: Text('${apiList![index].test}',//apiList![index].updatedDateTime
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          subtitle: Text('${apiList![index].result}'+"   "+'${apiList![index].unit}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.green),),
                          trailing: Text('${apiList![index].referenceRange}'),
                          
                          ),
                          // Padding(padding: EdgeInsets.symmetric(horizontal: 15)
                          //),
                          Divider(thickness: 1,
                          height: 15,),
                   
                    
                  ],

                        );
                      },
                    ),)
                    
                   
                   
                  
                  ],
                ),

              ),
                ),
                Card()


              ],
            ),

          );

        } ),
    ),);
  }
  
  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/api/Pathology?pathReportId=33923&opIpType=0";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Reportmodel.fromJson(item)).toList().cast<Reportmodel>();
  }
}