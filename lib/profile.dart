import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileEdit createState() => _ProfileEdit();
}

class _ProfileEdit extends State<ProfilePage> {
  // hide the password or not
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.5),
      body: Stack(
        children: [
          // container - background color
          Container(
            decoration: BoxDecoration(
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
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
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
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // textbox fields to fill/change
                buildTextField("Full Name", "Enter name", false),
                buildTextField("Email", "Enter email", false),
                buildTextField("Password", "Enter password", true),
              ],
            ),
          ),
        ],
      ),
      // back arrow to go back
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPassword) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField (
        // show the password - remove from hiding
        obscureText: isPassword ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPassword ?
              IconButton (
                icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                }
              ): null,
              contentPadding: EdgeInsets.only(bottom: 5),
              labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                )
        ),
      )
    );
  }




}
