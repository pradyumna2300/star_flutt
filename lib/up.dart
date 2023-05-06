// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class UpcomingSchedul extends StatelessWidget {
  const UpcomingSchedul({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(children:<Widget>[
      Padding(
              padding: EdgeInsets.only(bottom: 12, left: 50, right: 50),
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
                  //launchUrl(Uri.parse(
                      //'https://dart.dev/guides/language/effective-dart/style')),
                },
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      
                    title: Text("Dr Doctor Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    subtitle: Text("MBBS"),
                    //subtitle: Text("a"),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/doctor.png"),
                    ),
                    
                    ),
                     Padding(padding: EdgeInsets.symmetric(horizontal: 15)
                    ),
                    //Row(
                      //children: [
                        //Text("Hello"),
                        //Text("name")
                      //],
                    //),
                    
                    ListTile(
                      //trailing: Text("hello"),
                      //leading: Text("helo"),
                      
                      title: Text("Patient Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    
                    subtitle: Text("AGE"),

                    ),
                    
                    Divider(thickness: 1,
                    height: 20,),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                        Icon(Icons.calendar_month,
                      color:Colors.black54,
                      ),
                      SizedBox(width: 5,

                      ),
                      Text("16/04/2023",
                      style: TextStyle(
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
                    Text("10:30 Am",
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
    ),);
  }
}