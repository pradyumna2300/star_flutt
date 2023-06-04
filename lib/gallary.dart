// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;


import 'navbar.dart';
// To parse this JSON data, do
//
//     final gallerymodel = gallerymodelFromJson(jsonString);

import 'dart:convert';

List<Gallerymodel> gallerymodelFromJson(String str) => List<Gallerymodel>.from(json.decode(str).map((x) => Gallerymodel.fromJson(x)));

String gallerymodelToJson(List<Gallerymodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gallerymodel {
   // int id;
    String imagePath;
   // int flag;

    Gallerymodel({
       // required this.id,
        required this.imagePath,
       // required this.flag,
    });

    factory Gallerymodel.fromJson(Map<String, dynamic> json) => Gallerymodel(
        //id: json["Id"],
        imagePath: json["ImagePath"],
        //flag: json["Flag"],
    );

    Map<String, dynamic> toJson() => {
       // "Id": id,
        "ImagePath": imagePath,
        //"Flag": flag,
    };
}


class MyGallary extends StatefulWidget {
   MyGallary({super.key});

  @override
  State<MyGallary> createState() => _MyGallaryState();
}

class _MyGallaryState extends State<MyGallary> {
   List<Gallerymodel>? apiList;

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
          title: Text("Gallary"),
          backgroundColor:Color.fromARGB(255, 3, 138, 93),
        ),
        drawer: MyNavbar(),
        body: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
                    physics: ClampingScrollPhysics(),

              itemCount: apiList!.length,
        itemBuilder:(BuildContext context, int index){
          return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Text(
                "",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 50, right: 50),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Image(image:NetworkImage(
                          '${apiList![index].imagePath}'
                              )),),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 50, right: 50),
            ),
            
          ],
        );
        }
            )
        ));
  }

   Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/api/Gallery";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Gallerymodel.fromJson(item)).toList().cast<Gallerymodel>();
  }
}
