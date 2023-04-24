import 'package:flutter/material.dart';

// need to change ios and android setting to allow pulling of contact

class Contacts extends StatefulWidget {
  Contacts({Key? key}) : super(key: key);

  @override
  _Contacts createState() => _Contacts();
}

class _Contacts extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Contact List"),
        ),
        body: Container(
          height: double.infinity,
          child: FutureBuilder(
            future: getContacts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child:
                    SizedBox(height: 50, child: CircularProgressIndicator()),
                );
              }

            }
          )
        ),
      ),

    );
  }

  



}

