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
      theme: ThemeData(
          // App Theme (1)
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      // directs its to the splash page before opening app
      home: Splash(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  // controls the index of nav bar page
  int _selectedIndex = 1;
  TextEditingController nameController = TextEditingController();
  PageController _pageController = PageController(initialPage: 1);


  @override
  // on tap switch the page index
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack (
        children: <Widget> [
          // background color
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
          // store info on the other pages - used for page switch
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
      // navigation bar on the bottom icons/names
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Statistic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Messages",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,

      ), // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}

