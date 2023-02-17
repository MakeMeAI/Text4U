import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: const Center (
        child: Text (
          "AHHHHH in Progress.... GO BACK NOWWWW",
          style: TextStyle(fontSize: 50, color: Colors.teal, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
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