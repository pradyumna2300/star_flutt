// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

//import 'dart:convert';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;


// To parse required this JSON data, do
//
//     final billopdmodel = billopdmodelFromJson(jsonString);

import 'dart:convert';

List<Billopdmodel> billopdmodelFromJson(String str) => List<Billopdmodel>.from(
    json.decode(str).map((x) => Billopdmodel.fromJson(x)));

String billopdmodelToJson(List<Billopdmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Billopdmodel {
  String regNo;
  String patientName;
  String hospitalName;
  String hospitalAddress;
  String address;
  //String phoneNo;
  String mobileNo;
  String ageYear;
  String genderName;
  DateTime billDate;
  String serviceName;
  String departmentName;
  String pBillNo;
  //String chargesDoctorName;
  double chargesTotalAmount;
  double totalBillAmount;
  double concessionAmt;
  double netPayableAmt;
  String cashCounterName;
  String consultantDocName;


  Billopdmodel(
      {required this.regNo,
      required this.patientName,
      required this.hospitalName,
      required this.hospitalAddress,
      required this.address,
      required this.mobileNo,
      required this.ageYear,
      required this.genderName,
      required this.billDate,
      required this.serviceName,
      required this.departmentName,
      required this.pBillNo,
      //required this.chargesDoctorName,
      required this.chargesTotalAmount,
      required this.totalBillAmount,
      required this.concessionAmt,
      required this.netPayableAmt,
      required this.cashCounterName,
       required this.consultantDocName,
      });

  factory Billopdmodel.fromJson(Map<String, dynamic> json) => Billopdmodel(
        regNo: json["RegNo"],
        patientName: json["PatientName"],
        hospitalName: json["HospitalName"],
        hospitalAddress: json["HospitalAddress"],
        address: json["Address"],
        //phoneNo: json["PhoneNo"],
        mobileNo: json["MobileNo"],
        ageYear: json["AgeYear"],
        genderName: json["GenderName"],
        billDate: DateTime.parse(json["BillDate"]),
        serviceName: json["ServiceName"],
        departmentName: json["DepartmentName"],
        pBillNo: json["PBillNo"],
       // chargesDoctorName: json["ChargesDoctorName"],
        chargesTotalAmount: json["ChargesTotalAmount"],
        totalBillAmount: json["TotalBillAmount"],
        concessionAmt: json["ConcessionAmt"],
        netPayableAmt: json["NetPayableAmt"],
        cashCounterName: json["CashCounterName"],
         consultantDocName: json["ConsultantDocName"],
       
      );

  Map<String, dynamic> toJson() => {
        "RegNo": regNo,
        "PatientName": patientName,
        "HospitalName": hospitalName,
        "HospitalAddress": hospitalAddress,
        "Address": address,
        //"PhoneNo": phoneNo,
        "MobileNo": mobileNo,
        "AgeYear": ageYear,
        "GenderName": genderName,
        "BillDate": billDate.toIso8601String(),
        "ServiceName": serviceName,
        "DepartmentName": departmentName,
        "PBillNo": pBillNo,
       // "ChargesDoctorName": chargesDoctorName,
        "ChargesTotalAmount": chargesTotalAmount,
        "TotalBillAmount": totalBillAmount,
       "ConcessionAmt": concessionAmt,
        "NetPayableAmt": netPayableAmt,
        "CashCounterName": cashCounterName,
        "ConsultantDocName": consultantDocName,
        
        
      };
}

class MyOpdBill extends StatefulWidget {
  
  final String id;
  const MyOpdBill({super.key,required this.id});

  @override
  State<MyOpdBill> createState() => _MyOpdBillState();
}

class _MyOpdBillState extends State<MyOpdBill> {
  List<Billopdmodel>? apiList;
  bool isLoading = true;

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
        : SingleChildScrollView(
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
                          padding:
                              EdgeInsets.only(bottom: 10, left: 50, right: 50),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            " OPD Final Bill",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          thickness: 4,
                          height: 45,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${apiList![index].hospitalName}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 3, 84, 10))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${apiList![index].hospitalAddress}",
                              style: TextStyle(
                                  fontSize: 15,
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
                          "Patient Name :" +
                              " ${apiList![index].patientName}", //PatientNamee
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 53, 7)),
                        ),
                        ListTile(
                          title: Text(
                            "RegNo :" + "${apiList![index].regNo}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 106, 53, 7)),
                          ), //RegNo
                          subtitle: Text(
                            "Age :" +
                                "${apiList![index].ageYear}", //${apiList![index].age}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 106, 53, 7)),
                          ),
                          trailing: Text(
                            "Gender :" +
                                "${apiList![index].genderName}", //"${apiList![index].genderName}",
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
                              padding: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                "Address :  " + "${apiList![index].address}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                              //decoration: BoxDecoration(color: Colors.yellow),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 5),
                              child: Text(
                                "Mobile NO :  " + "${apiList![index].mobileNo}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 5),
                              child: Text(
                                "Bill Date :  " +
                                    "${apiList![index].billDate.toString().split(" ")[0]}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 5),
                              child: Text(
                                "Bill Number :  " +
                                    "${apiList![index].pBillNo}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 5),
                              child: Text(
                                "Department :  " +
                                    "${apiList![index].departmentName}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.black,
                              height: 3,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 5),
                              child: Text(
                                "Doctor Name : " +
                                    "${apiList![index].consultantDocName}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, bottom: 5),
                              child: Text(
                                "Ref. Doctor : ", //+"${apiList![index].doctorname}",style: TextStyle(
                                // fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                //color: Color.fromARGB(255, 11, 5, 0)),
                              ),
                            ),
                            Divider(
                              thickness: 3,
                              color: Colors.black,
                              height: 3,
                            ),
                                                     ],
                        ),
                      ],
                    ));
                  },
                ),
              ),
              ////////////////////////////list of items for billing
              ///
              
              Container(
                child: Column(
                  children: [
                    Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //Divider(thickness: 2,height: 2,color:Colors.black ,),
                                          Text('Service Name',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 3, 84, 10))),
                                          SizedBox(height: 10),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //Divider(thickness: 2,height: 2,color:Colors.black ,),
                                          Text(
                                              "Total Amount", //'${apiList![index].chargesTotalAmt}',
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 1, 21, 3))),
                                          SizedBox(height: 10),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                  ],
                  
                ),
              ),
             Divider(
                              thickness: 3,
                              color: Colors.black,
                              height: 3,
                            ),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: apiList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                   left: 50, right: 50),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //Divider(thickness: 2,height: 2,color:Colors.black ,),
                                          Text('${apiList![index].serviceName}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 3, 84, 10))),
                                         
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //Divider(thickness: 2,height: 2,color:Colors.black ,),
                                          Text(
                                              "${apiList?[index].chargesTotalAmount}", //'${apiList![index].chargesTotalAmt}',
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 1, 21, 3))),
                                         
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Divider(
                              thickness: 2,
                              color: Colors.black,
                              height: 3,
                            ),
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
                              padding: EdgeInsets.only(
                                   left: 50, right: 50),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //Divider(thickness: 2,height: 2,color:Colors.black ,),
                                          Text('',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 3, 84, 10))),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 50, bottom: 5),
                                            child: Text(
                                                "Amt In Words : Rs. Two Thousand One Hundred Only", //'${apiList![index].serviceName}',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 1, 21, 3))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //Divider(thickness: 2,height: 2,color:Colors.black ,),
                                          Text(
                                              "Bill Amount  :" +
                                                  "${apiList?[index].totalBillAmount}", //'${apiList![index].chargesTotalAmt}',
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 1, 21, 3))),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                                "Discount  :" +
                                                    " ${apiList?[index].concessionAmt} ", //'${apiList?[index].price}',
                                                maxLines: 1,
                                                softWrap: false,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 1, 21, 3))),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                                "Paid Amount  :" +
                                                    " ${apiList?[index].netPayableAmt} ", //'${apiList?[index].price}',
                                                maxLines: 1,
                                                softWrap: false,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 1, 21, 3))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            
                            Row(
                              children: [
                                Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Cashier        ",
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 1, 21, 3))),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("${apiList?[index].cashCounterName}         ",
                                                maxLines: 1,
                                                softWrap: false,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 1, 21, 3))),
                                          )
                                        ]))
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getApiData() async {
    String url = "http://mobileapis.clinosys.com/api/Bill?billNo=${widget.id}&opIpType=0";//3
    var result = await http.get(Uri.parse(url));
    print(result.statusCode);
    print(result.body);
    if (result.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      log(result.body);
      apiList = jsonDecode(result.body)
        .map((item) => Billopdmodel.fromJson(item))
        .toList()
        .cast<Billopdmodel>();
  }
    }

   /* apiList = jsonDecode(result.body)
        .map((item) => Billopdmodel.fromJson(item))
        .toList()
        .cast<Billopdmodel>();*/
  }

