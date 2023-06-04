import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'navbar.dart';

// To parse this JSON data, do
//
//     final servicesmodel = servicesmodelFromJson(jsonString);

import 'dart:convert';

List<Servicesmodel> servicesmodelFromJson(String str) => List<Servicesmodel>.from(json.decode(str).map((x) => Servicesmodel.fromJson(x)));

String servicesmodelToJson(List<Servicesmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Servicesmodel {
    int idNum;
    String title;
    dynamic description;
    String image;

    Servicesmodel({
        required this.idNum,
        required this.title,
        this.description,
        required this.image,
    });

    factory Servicesmodel.fromJson(Map<String, dynamic> json) => Servicesmodel(
        idNum: json["id_num"],
        title: json["Title"],
        description: json["Description"],
        image: json["Image"],
    );

    Map<String, dynamic> toJson() => {
        "id_num": idNum,
        "Title": title,
        "Description": description,
        "Image": image,
    };
}


class MyServices extends StatefulWidget {
  
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  List<Servicesmodel>? apiList;
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
          title: Text("CheckOut Services"),
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
            Container(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                elevation: 6,
                color: Colors.amber.shade100,
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
                          height: 240,
                          fit: BoxFit.cover,
                          image:  NetworkImage(
                          '${apiList![index].image}'
                              )),
                       Text(
                        '${apiList![index].title}',
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
            ),
                     ]);}
        )));
  }

  Future<void> getApiData() async{
    String url="http://mobileapis.clinosys.com/api/Services";
    var result= await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    apiList=jsonDecode(result.body).map((item) => Servicesmodel.fromJson(item)).toList().cast<Servicesmodel>();
  }
}
