import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileEdit createState() => _ProfileEdit();
}

class _ProfileEdit extends State<ProfilePage> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.5),
      body: Stack(
        children: [
          // container - background color
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
          // container - for the profile icon
          Container(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      // this container does the profile picture
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                          shape: BoxShape.circle,
                        ),
                      ),
                      // position - adds the tiny edit pencil
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildTextField("Full Name", "Enter name", false),
                buildTextField("Email", "Enter email", false),
                buildTextField("Password", "Enter password", true),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField (
        obscureText: isPassword ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPassword ?
              IconButton (
                icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                }
              ): null,
              contentPadding: const EdgeInsets.only(bottom: 5),
              labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                )
        ),
      )
    );
  }




}
