// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'navbar.dart';
import 'dart:convert';


List<Contactmodel> contactmodelFromJson(String str) => List<Contactmodel>.from(json.decode(str).map((x) => Contactmodel.fromJson(x)));

String contactmodelToJson(List<Contactmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contactmodel {
    int id;
    String description;
    String contactNo;

    Contactmodel({
        required this.id,
        required this.description,
        required this.contactNo,
    });

    factory Contactmodel.fromJson(Map<String, dynamic> json) => Contactmodel(
        id: json["Id"],
        description: json["Description"],
        contactNo: json["Contact_No"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Description": description,
        "Contact_No": contactNo,
    };
}

class MyContactUs extends StatefulWidget {
  const MyContactUs({super.key});

  @override
  State<MyContactUs> createState() => _MyContactUsState();
}

class _MyContactUsState extends State<MyContactUs> {
  List<Contactmodel> apiList = List.empty();
  //List<ContactModel> selectedContacts = List.empty();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
    
  }


  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Contact Numbers"),
        backgroundColor: Color.fromARGB(255, 3, 138, 93),
      ),
      drawer: MyNavbar(),
      body: SafeArea(
          child: Container(
        child: ListView.builder(
            itemCount: apiList!.length,
            itemBuilder: (BuildContext context, int index) {
              return ContactItem(
                  apiList[index].description,
                  apiList[index].contactNo,
                  //contacts[index].isSelected,
                  index);
            }),
      )),
    ));
  }

  Widget ContactItem(
      String description, String contactNo, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 14),
              elevation: 20,
              color: Colors.amber.shade100,
              semanticContainer: true,
      
      child: ListTile(
       // minVerticalPadding: 50,
        leading: CircleAvatar(
          backgroundColor: Colors.green[700],
          child: Icon(
            Icons.person_outline_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          '${apiList![index].description}',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
        ),
        subtitle: Text(contactNo,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        onLongPress: () {},
        trailing: 
             Icon(
                Icons.call,
                color: Colors.green[700],
              ),
           // : Icon(Icons.call, color: Colors.green[700]),
        onTap: () async {
          final Uri url = Uri(
            scheme: 'tel',
            path: (contactNo),
          );
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
      ),
    );
  }
  Future<void> getApiData() async {
    String url =
        "http://mobileapis.clinosys.com/api/Contact";
    var result = await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    
    apiList=jsonDecode(result.body).map((item) => Contactmodel.fromJson(item)).toList().cast<Contactmodel>();
    
  }
}
