// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:star_flutt/home.dart';
import './service.dart';
import 'package:star_flutt/bottomnavbar.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                 controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                 controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            ElevatedButton(
              
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Color.fromARGB(255, 252, 253, 254), fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  login();
                  //Navigator.push(
                     // context, MaterialPageRoute(builder: (context) => BottomBar()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
  Future<void> login() async {
    //var id;
    

    //IMPLEMENT USER LOGIN
    // if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      // Map data = {
      //   'strEmail': emailController.text,
      //   'strPassword': passwordController.text
      // };
     // Map<Widget, Widget> headers = {"Content-Type": "application/json"};
      // String body =json.encode(data);

      var res = await http.post(Uri.parse("http://mobileapis.clinosys.com/api/Login?strEmail=${emailController.text}&strPassword=${passwordController.text}"));   


      //  var response = await http.post(
      //     Uri.parse("http://192.168.43.253/api/Login?strEmail=${emailController.text}&strPassword=${passwordController.text}"),
      //     //http://restapi.adequateshop.com/api/authaccount/login
      //     headers: headers,
      //     body: body);

          print(res.statusCode);
      if (res.statusCode == 200) {
        print(res.body);
        var userId = res.body;
        
        
        //print(res.id);
        String msg = jsonDecode(res.body);
        print(jsonDecode(res.body));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(res.body),
         
        ));
        //msg=="Login Successful"res.statusCode == 200
        if(res.statusCode == 200){
          
           //ignore: use_build_context_synchronously
           Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyBottomBar()));

        }
       
      } else {
        //Navigator.push(
        //  context, MaterialPageRoute(builder: (context) => MyHome()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid credensial"),
        ));
      }
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text("Invalid"),
    //   ));
    // }
  }
}



