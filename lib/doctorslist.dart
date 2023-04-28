// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'navbar.dart';

class MyDoctorList extends StatelessWidget {
  MyDoctorList({super.key});

   final List<String> tripList=["a","b"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Doctors List"),
          backgroundColor: Color.fromARGB(255, 3, 138, 93),
        ),
       // drawer
        body: Container(
           child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index){
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
                    const Text(
                      'Dr.Pankaj Gore',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),const SizedBox(height: 4),
                    const Text(
                      'MBBS,MD,DNB',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),const SizedBox(height: 3),
                    const Text(
                      'Medicine&Critical Care',
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
        })
      )





               
            
           
          
            
              
         
        
        
    );
  }
}


//https://www.nanavatimaxhospital.org/controlpanel/uploadedfiles/gallery/1570613870_Different_Types_Of_Radiology_Techniques_-_Nanavati_Hospital_564x533.jpg