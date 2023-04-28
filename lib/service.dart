import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './login.dart';

class Service {
  Future<http.Response> saveUser(
      String name, String email, String mobile, String address) async {
    //create uri
    var uri =
        Uri.parse("https://expert-stone-production.up.railway.app/register");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'address': address,
    };
    //convert the above data into json
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }

  Future<http.Response> bookPatient(
      String address,
      String age,
      String date,
      String gender,
      String mobile,
      String name,
      String problem,
      String time) async {
    //create uri
    var uri =
        Uri.parse("https://expert-stone-production.up.railway.app/booking");
    //header
    Map<String, String> headers = {
      "Content-Type": "application/json ;charset=UTF-8"
    };
    //body
    Map data = {
      'name': '$name',
      'mobile': '$mobile',
      'address': '$address',
      'problem': '$problem',
      'gender': '$gender',
      'age': '$age',
      'date': '$date',
      'time': '$time'
    };
    //convert the above data into json
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }
}
