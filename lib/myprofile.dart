import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String email;
  final String gender;
  final String address;
  final String mobile;
  final String password;

  UserProfile({ required this.name,required this.email,required this.gender,required this.address,required this.mobile,required this.password});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['FullName'],
      email: json['Email'],
      gender: json['Gender'],
      address: json['Address'],
      mobile:json['Mobile'],
      password: json['Password']
    );
  }
}





class UserProfileService {
  static const String apiUrl = 'http://192.168.43.253/Api/Profile?id=5';

  static Future<UserProfile> fetchUserProfile() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
       print(response.body);

      final jsonBody = jsonDecode(response.body);
      return UserProfile.fromJson(jsonBody);
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }
}




class UserrofilePage extends StatefulWidget {
  @override
  _UserrofilePageState createState() => _UserrofilePageState();
}


class _UserrofilePageState extends State<UserrofilePage> {
  late Future<UserProfile> _futureUserProfile;

  @override
  void initState() {
    super.initState();
    _futureUserProfile = UserProfileService.fetchUserProfile();
  }
  bool showPassword = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              
            },
          ),
        ],
      ),

      body: Container(

        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },

          child: FutureBuilder<UserProfile>(
            future:  _futureUserProfile,
            builder: (context,snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              
                              image:AssetImage('assets/doctor.png'),)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
                 // Text('Name: ${snapshot.data!.name}'),
                  //Text('Email: ${snapshot.data!.email}'),
                  //Text('Gender: ${snapshot.data!.gender}'),
                   SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", '${snapshot.data!.name}', false),
             // buildTextField("Full Name", "Pradyumna kulkarni", false),
              buildTextField("E-mail", '${snapshot.data!.email}', false),
              buildTextField("Gender", '${snapshot.data!.gender}', false),
              buildTextField("Address", '${snapshot.data!.address}', false),
              buildTextField("Mobile", '${snapshot.data!.mobile}', false),
              buildTextField("Password", '${snapshot.data!.password}', true),
              

                  SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                     style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton (
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    //color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )



                  ],

                );
              }else if (snapshot.hasError){
                return  Text('Error: ${snapshot.error}');
              } else {
              return CircularProgressIndicator();
            }

            },
          ) ,
        

      ),

     

    ),);

}

Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }


}