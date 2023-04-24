import 'package:flutter/material.dart';
import 'package:text4u/convoBubble.dart' as contextBox;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:text4u/helper/requests.dart' as requests;
import "page2.dart";
import "HomePage.dart";
import 'ContactList.dart';
import 'Sidebar.dart';
import 'Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // App Theme (1)
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      //home: HomePage(),
      home: Splash(),
    );
  }
}



// class Nav extends StatelessWidget {
//   //old declration locations
//   String name = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//      decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.purple,
//               Colors.blue,
//             ],
//           )
//       ),
//       child: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  TextEditingController nameController = TextEditingController();
  PageController _pageController = PageController(initialPage: 1);



  final List<Widget> _pageOptions = <Widget>[
    Page2(),
    HomePage(),
    const Text("Messages"),
  ];


  @override
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    });
  }

  // delete if fails
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Rerunning build (4)
    return new Scaffold (
      //drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack (
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple,
                  Colors.blue,
                ],
              )
           ),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (newIndex) {
              setState(() {
                _selectedIndex = newIndex;
              });
            },
            children: [
              Page2(),
              landingPage(),
              ContactList(),
            ],
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            tooltip: 'Camera',
            label: "Page 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Calls',
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            tooltip: 'Chats',
            label: "Messages",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,

      ), // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}

