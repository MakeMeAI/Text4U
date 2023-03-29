import 'package:flutter/material.dart';
import 'sidebar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Welcome back, NAME"),
        backgroundColor: Colors.transparent,
        //automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center (
        child: Container (
        ),
      ),
    );
  }
}