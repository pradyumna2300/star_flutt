// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/bills/opd/opdbill.dart';

import 'package:http/http.dart' as http;


import 'dart:convert';

List<Billlistopdmodel> billlistopdmodelFromJson(String str) => List<Billlistopdmodel>.from(json.decode(str).map((x) => Billlistopdmodel.fromJson(x)));

String billlistopdmodelToJson(List<Billlistopdmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Billlistopdmodel {
    int billNo;

    Billlistopdmodel({
        required this.billNo,
    });

    factory Billlistopdmodel.fromJson(Map<String, dynamic> json) => Billlistopdmodel(
        billNo: json["BillNo"],
    );

    Map<String, dynamic> toJson() => {
        "BillNo": billNo,
    };
}



class MyOpdBillList extends StatefulWidget {
   final String id;
  const MyOpdBillList({super.key,required this.id});

  @override
  State<MyOpdBillList> createState() => _MyOpdBillListState();
}

class _MyOpdBillListState extends State<MyOpdBillList> {
  List<Billlistopdmodel>? apiList;
  bool isLoading = true;

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
      
      child:  isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
            : ListView.builder(
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
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyOpdBill(
                                                        id: apiList![index]
                                                            .billNo
                                                            .toString(),
                                                      )))
                  // Navigator.push(
           // context, MaterialPageRoute(builder: (context) => MyOpdBill()))
                  
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const SizedBox(height: 40),
                    Text(
                      'Bill Number : '+'${apiList![index].billNo}',//cbc
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
                          "12/05/2023",
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
    String url="http://mobileapis.clinosys.com/api/Bill?opdIpdId=${widget.id}&opIpType=0";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
     if (result.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      log(result.body);
      apiList=jsonDecode(result.body).map((item) =>  Billlistopdmodel.fromJson(item)).toList().cast<Billlistopdmodel>();
 
    }
   // apiList=jsonDecode(result.body).map((item) =>  Billlistopdmodel.fromJson(item)).toList().cast<Billlistopdmodel>();
  }
}