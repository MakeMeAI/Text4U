import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Welcome"),
        backgroundColor: Color(0x4400000000),
        elevation: 0,
      ),
      body: Center (
        child: Container (
        ),
      ),

      /*
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: () {
          Navigator.pop(context);
        },
      ), */
    );
  }
}