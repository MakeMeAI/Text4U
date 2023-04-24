import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:text4u/helper/requests.dart' as requests;


class landingPage extends StatefulWidget {
  @override
  _landingPageState createState() => _landingPageState();
}


class _landingPageState extends State<landingPage> {
  String name = '';
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // update welcome banner once name is received
        title: Text("Welcome back, ${name ?? ''}"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center (
        child: Stack (
            children: <Widget> [
              // background color
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purple,
                      Colors.blue,
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0.0),
                child: Align(
                  alignment: Alignment.center,
                  child: FractionalTranslation(
                    translation: const Offset(0.0, -1.0),
                    // text box look
                    child: TextField(
                      cursorColor: Colors.white,
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Please Enter Your Name ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ),
              // position of question box in the middle of screen
              Positioned(
                top: MediaQuery.of(context).size.height / 2 + 50,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Text("Name: ${name.toString()}"),
              ),
              Center(
                // communicating with the backend with the name received
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await requests.postData(nameController.text);
                    var data = convert.jsonDecode(response.body);
                    var jsonResponse = convert.jsonDecode(response.body);
                    setState(() {
                      name = data['message'] ?? '';
                      name = jsonResponse['name'] ?? '';
                    });
                  },

                  child: Text("Submit"),
                ),
              ),
            ]
        ),
      ),
    );
  }
}