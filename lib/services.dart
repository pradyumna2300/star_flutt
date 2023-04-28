import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'navbar.dart';

class MyServices extends StatelessWidget {
  const MyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CheckOut Services"),
          backgroundColor:Color.fromARGB(255, 3, 138, 93),
        ),
        drawer: MyNavbar(),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            ),
            Card(
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
                        image: const NetworkImage(
                            'https://www.nanavatimaxhospital.org/controlpanel/uploadedfiles/gallery/1570613870_Different_Types_Of_Radiology_Techniques_-_Nanavati_Hospital_564x533.jpg')),
                    const Text(
                      'Clinovation',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            ),
            Card(
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
                        image: const NetworkImage(
                            'https://www.shutterstock.com/image-photo/pharmacists-hospital-pharmacy-focus-on-260nw-698841325.jpg')),
                    const Text(
                      'Clinovation',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            ),
            Card(
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
                        image: const NetworkImage(
                            'https://www.kailashhealthcare.com/UserFiles/Department/819a9d8c-577b-43bf-a844-3fe83d52ad2bBANNER.jpg')),
                    const Text(
                      'Clinovation',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
            ),
            Card(
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
                        image: const NetworkImage(
                            'https://extrabrains.net/wp-content/uploads/2019/07/Dentist-internet-marketing.png')),
                    const Text(
                      'Clinovation',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
