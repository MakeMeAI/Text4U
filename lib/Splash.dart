import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key ? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _toHome();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text(
              'Splash',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          ),
        ),
      ),
    );
  }
}