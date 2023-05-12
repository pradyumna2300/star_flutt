// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, use_build_context_synchronously

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

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Service service = Service();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.only(left: 35, top: 143),
                // ignore: prefer_const_constructors
                child: Text(
                  'Welcome\nBack',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 35, top: 300),
                child: Text(
                  'Sign In Here',
                  style: TextStyle(
                      color: Color(0xff4c505b),
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Builder(
                  builder: (context) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                                    validator: (value) {
                                      if(value!.isEmpty){
                                        return "required";
                                      }
                                      return null;
                                    },
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                                    validator: (value) {
                                      if(value!.isEmpty){
                                        return "required";
                                      }
                                      return null;
                                    },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Color(0xff4c505b),
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                    //login();
                                    Navigator.pushNamed(context, 'home');

                                    }
                                    //Navigator.pushNamed(context, 'home');
                                  },
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 18,
                                      color: Color(0xff4c505b),
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 18,
                                      color: Color(0xff4c505b),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  }
                ),
              ))
            ],
          )),
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
      // Map<String, String> headers = {"Content-Type": "application/json"};
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
        if(msg=="Login Successful"){
          
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
