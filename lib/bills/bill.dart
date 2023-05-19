// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:star_flutt/model/dischargesum.dart';

class Billmodel{
   String groupName;
   String serviceName;
   //int price;
    Billmodel({
        required this.groupName,
        required this.serviceName,
       // required this.price,
        });

     factory Billmodel.fromJson(Map<String, dynamic> json) => Billmodel(
        groupName: json["GroupName"],
        serviceName: json["ServiceName"],
        //price: json["Price"],
   );    
   Map<String, dynamic> toJson() => {
        "GroupName": groupName,
        "ServiceName": serviceName,
       // "Price": price,
     };

}

class MyBill extends StatefulWidget {
  const MyBill({super.key});

  @override
  State<MyBill> createState() => _MyBillState();
}

class _MyBillState extends State<MyBill> {
  List<Billmodel>? apiList;
  
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
        title: Text("BILL"),
        backgroundColor: Color.fromARGB(255, 5, 117, 134),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, left: 50, right: 50),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            " IPD Final Bill",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          
                        ),
                        Divider(
                          thickness: 4,
                          height: 45,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Hospital Name",//"${apiList![index].hospitalName}",
                          style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 3, 84, 10))),
                        ),
                        Divider(
                          thickness: 3,
                          height: 45,
                          color: Colors.black,
                        ),
                        Text(
                          //"${apiList![index].patientName}",//
                          "Patient Name :",// + " ${apiList![index].patientName}", //PatientNamee
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 53, 7)),
                        ),
                        ListTile(
                          title: Text(
                            "RegNo :",// + "${apiList![index].regNo}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 106, 53, 7)),
                          ), //RegNo
                          subtitle: 
                              Text(
                            "Age :" ,//+ "${apiList![index].age}",//${apiList![index].age}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 106, 53, 7)),
                          ),
                          trailing: Text(
                            "Gender :" ,//+ "${apiList![index].genderName}",//"${apiList![index].genderName}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 106, 53, 7)),
                          ),
                        ),
                        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15,bottom: 5),
                              child: Text(
                                "Address :  ",//+"${apiList![index].address}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              //decoration: BoxDecoration(color: Colors.yellow),
                            ),
                            Container(
                               padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                               child: Text(
                                "Mobile NO :  ",//+"${apiList![index].mobileNo}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              ),
                               Container(
                               padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                               child: Text(
                                "Bill Date :  ",//+"${apiList![index].admissionDate .toString()
                                            // .split(" ")[0]}" +" "+"${apiList![index].billDate}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              ),
                             
                              Container(
                               padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                               child: Text(
                                "DOA :  ",//+"${apiList![index].admissionDate .toString()
                                            // .split(" ")[0]}" +" "+"${apiList![index].admissionDate}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              ),
                               Container(
                               padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                               child: Text(
                                "DOD :  ",//+"${apiList![index].admissionDate .toString()
                                            // .split(" ")[0]}" +" "+"${apiList![index].admissionDate}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              ),
                             
                              Container(
                               padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                               child: Text(
                                "IP No :  ",//+"${apiList![index].ipdNo}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              ),
                              Container(
                               padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                               child: Text(
                                "Room Type :  ",//+'${apiList![index].roomName}' +"  "+"Ward No : "+"${apiList![index].bedId}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              ),
                              Divider(thickness: 1,color: Colors.black,height: 3,),
                              Container(padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                            
                              child: Text("Doctor Name : ",//+"${apiList![index].doctorname}",style: TextStyle(
                                   // fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                    //color: Color.fromARGB(255, 11, 5, 0)),
                              ),),
                              Container(padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
                            
                              child: Text("Ref. Doctor : ",//+"${apiList![index].doctorname}",style: TextStyle(
                                   // fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                    //color: Color.fromARGB(255, 11, 5, 0)),
                              ),),Divider(thickness: 1,color: Colors.black,height: 3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(" Details ",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 11, 5, 0)),),
                                      
                            ),
                            Row(),
                            
                           
                            
                            
                            
                          ],
                        ),
                      ],
                    ));
                  },
                  
                ),
                
              ),
               Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            " IPD Final Bill",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          
                        ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: apiList!.length,
                  itemBuilder: (BuildContext context, int index){
                  return Container(child: Column(children:<Widget>[
                     Padding(
                          padding: EdgeInsets.only(bottom: 10, left: 50, right: 50),
                        ),
                       
                        Card(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Divider(thickness: 2,height: 2,color:Colors.black ,),
                        Text('${apiList![index].groupName}',style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 3, 84, 10))),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 10,bottom: 5),
                          child: Text('${apiList![index].serviceName}', style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 1, 21, 3))
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                         Divider(thickness: 2,height: 2,color:Colors.black ,),
                        Text(
                          "2",//'${apiList![index].chargesTotalAmt}',
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 1, 21, 3))
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(right: 55,bottom: 5),
                          child: Text(
                            "2",//'${apiList?[index].price}',
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                             style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 1, 21, 3))
                        
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    
                       /* Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                           
                          children: [
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 15,bottom: 5)),
                                Text('Hospital Charges'),
                              ],
                              
                            ),
                            Row(
                              
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                               crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  
                                  //padding: EdgeInsets.only(left: 215,bottom: 5),
                                  child: Text("5400"),
                                

                                ),
                                
                              ],
                            )
                          ],
                        ),*/
      
                  ],),);
                }),
              ),
            ],
          ),
        ),
      ),
      
      
    );
  }

  Future<void> getApiData() async {
    String url =
        "http://mobileapis.clinosys.com/api/Bill?billNo=42&opIpType=1";
    var result = await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    
    apiList=jsonDecode(result.body).map((item) => Billmodel.fromJson(item)).toList().cast<Billmodel>();
    
  }
 
}
