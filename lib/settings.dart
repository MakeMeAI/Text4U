import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.2),
      body: Center (
        child: Container (
            decoration: BoxDecoration(
                border: Border.all( width: 1, color: Colors.transparent),
                borderRadius: const BorderRadius.all(const Radius.circular(40)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple.shade500,
                    Colors.deepPurpleAccent.shade100,
                  ],
                )
            ),
          child: Center(
            child: Text('Very legit settings page'),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

